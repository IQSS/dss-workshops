#utils.py

import os
import sys
import pickle
import time
from azure.storage.blob import BlockBlobService, PublicAccess
from azure.storage.blob import ContentSettings

def get_files(dir_files):
    """"store file name, extension and path

    INPUT: directory of the files you want to find path, name, and extension     
    OUTPUT: lists with names, paths, and extensions of the files in the directory
    """
    
    files_name = []
    files_path = []
    files_extension = []
    
    for root, directories, files in os.walk(dir_files):
        for file in files:
            files_name.append(file)
            files_path.append(os.path.join(root,file))
            files_extension.append(file.split('.')[-1])
            
    print('Data stored from directory):\t {}'.format(dir_files))
          
    return files_name, files_path, files_extension


def retrieve_keys(service_name, PATH_TO_KEYS, KEYS_FILE_NAME):
    """"function to retrieve_keys. return name and key for the selected cloud computing service"""
  
    path_to_keys = os.path.join(PATH_TO_KEYS, KEYS_FILE_NAME)

    with open(path_to_keys, 'rb') as handle:
        azure_keys = pickle.load(handle)

    service_key = azure_keys[service_name]
    
    return service_key

def make_public_container(STORAGE_NAME, STORAGE_KEY, NEW_CONTAINER_NAME):
    """"create blob service, blob container and set it to public access. return blob service"""
    
    blob_service = BlockBlobService(account_name= STORAGE_NAME, account_key=STORAGE_KEY)
    new_container_status = blob_service.create_container(NEW_CONTAINER_NAME) 
    blob_service.set_container_acl(NEW_CONTAINER_NAME, public_access=PublicAccess.Container)
    
    if new_container_status == True:
        print('{} BLOB container has been successfully created: {}'.format(NEW_CONTAINER_NAME, new_container_status))
    else:
        print('{} something went wrong: check parameters and subscription'.format(NEW_CONTAINER_NAME))

def upload_file(STORAGE_NAME, STORAGE_KEY, NEW_CONTAINER_NAME, file, path, extension, content_type):
    """create blob service, and upload files to container"""
    
    blob_service = BlockBlobService(account_name= STORAGE_NAME, account_key=STORAGE_KEY)
    
    try:
        blob_service.create_blob_from_path(NEW_CONTAINER_NAME, file, path, content_settings=ContentSettings(content_type= content_type+extension))    
        print("{} // BLOB upload status: successful".format(file))

    except:
        print("{} // BLOB upload status: failed".format(file))


def upload_files_to_container(STORAGE_NAME, STORAGE_KEY, NEW_CONTAINER_NAME, DIR_FILES):
    """create container, get files, and upload to storage"""

    #call funtion to make container
    make_public_container(STORAGE_NAME, STORAGE_KEY, NEW_CONTAINER_NAME)

    print('------------------------------------------------------------------------------------------------------------------')

    #find names, paths and extension of the files stored into directory
    files_name, files_path, files_extension = get_files(DIR_FILES)

    #set uploading procedure starting time
    print('------------------------------------------------------------------------------------------------------------------')
    print("Start uploading files")
    print('------------------------------------------------------------------------------------------------------------------')
    start = time.time()


    # #upload all files at once to the new container
    # count = 0
    # for path, file, ext in zip(files_path, files_name, files_extension):
    #     upload_file(STORAGE_NAME, STORAGE_KEY, NEW_CONTAINER_NAME, file, path, ext, CONTENT_TYPE)
    #     count += 1
    #     #add print only failed otherwise good to go


    #set different content types
    content_types = ['image/', 'audio/x-', 'text/']

    #upload all remaining files having different format at once
    count = 0
    for path, file, ext in zip(files_path, files_name, files_extension):
        if ext == 'csv' or ext == 'txt':
            upload_file(STORAGE_NAME, STORAGE_KEY, NEW_CONTAINER_NAME, file, path, ext, content_types[2])
        elif ext == 'mp3' or ext == 'wav':
            upload_file(STORAGE_NAME, STORAGE_KEY, NEW_CONTAINER_NAME, file, path, ext, content_types[1])
        elif ext == 'jpg' or ext == 'jpeg' or ext == 'png':
            upload_file(STORAGE_NAME, STORAGE_KEY, NEW_CONTAINER_NAME, file, path, ext, content_types[0])
        else:
            raise ValueError('This is not a valid extension. Go to documentation: \
                             http://azure.github.io/azure-storage-python/ref/azure.storage.blob.models.html#azure.storage.blob.models.ContentSettings')
        count += 1

    #set procedure ending time
    end = time.time()
    print('------------------------------------------------------------------------------------------------------------------')
    print('Uploading completed')
    print('------------------------------------------------------------------------------------------------------------------')
    print('It took {} seconds to upload {} files'.format(round(end - start, 2), count))


def retrieve_blob_list(STORAGE_NAME, STORAGE_KEY, container_name):
    """ 
    function to get a list of BLOBs' URLs from a BLOB container
    
    INPUT: storage account credentials, and container name      
    OUTPUT: lists of BLOB names and URLs
    """

    blob_service = BlockBlobService(STORAGE_NAME, STORAGE_KEY)
    uploaded_file = blob_service.list_blobs(container_name)
    blob_url_format = 'https://{0}.blob.core.windows.net/{1}/{2}'
    #store blobs' name and URLs in list
    blob_name_list = []
    blob_url_list = []
    # retrive each blob name
    for blob in uploaded_file:
        blob_name_list.append(blob.name)
        blob_url_list.append(blob_url_format.format(blob_service.account_name, container_name, blob.name))
    return blob_name_list, blob_url_list


def delete_container(STORAGE_NAME, STORAGE_KEY, CONTAINER_NAME):

    ##############################################################
    #RUN THIS ONLY IF YOU WANT TO DELETE A CONTAINTER            #
    #REMEMBER TO DOWNLOAD YOUR DATA BEFORE DELETING THE CONTAINER#
    #IMPORTANT: YOU WILL LOOSE YOUR BLOB INTO THE CONTAINER      #
    ##############################################################

    blob_service = BlockBlobService(account_name= STORAGE_NAME, account_key=STORAGE_KEY)

    #delete container
    delete_container = blob_service.delete_container(CONTAINER_NAME)
    print("{} delition status success: {}".format(CONTAINER_NAME, delete_container))