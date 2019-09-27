## Sally Clark simulation

#Given that there are around 700,000 live births

n.births <- 700000

## probability of SIDS
p.sids <- 1/8543

## child bearing years

## simulation


x <- c(1, rep(0, 8543))

system.time(r <- replicate(500, sample(x, 700000, replace=TRUE) + sample(x, 700000, replace=TRUE)))


dat <- read.table(
    text = "x y g
    0 0 1
    0 0 2
    0 0 3
    0 0 4
    0 0 5
    0 0 6
    0 0 7
    0 0 8
    0 0 9 
    1 8 1
    1 8 2
    1 8 3
    1 0 4
    1 0 5
    1 0 6
    1 -8 7
    1 -8 8
    1 -8 9
    2 11 1
    2 8 2
    2 5 3
    2 3 4
    2 0 5
    2 -3 6
    2 -5 7
    2 -8 8
    2 -11 9",
    header=TRUE)


dat.labels <- unique(dat[1:2])
dat.labels <- within(dat.labels, {
    label <- c("", rep(c("Survived",  "SIDS", "Homicide"), 4))
    h <- strheight(label, 'inches')
    w <- strwidth(label, 'inches')
    p.x <- c(NA, rep(.5, 3), rep(1.5, 9))
    p.y <- c(NA, 4.5, .5, -3.5, 10, 8.5, 7, 2, .5, -1, -6, -7.5, -9)
    p.label <- c("", rep(c("30241/30243", "1/8543", "1/21700"), 4))
    g <- c(NA, 1,5,3, 1:9)
})


prob.tree <- ggplot(dat, aes(x=x, y=y)) + geom_line(aes(group=g)) +
    geom_rect(aes(xmin=x-h/2, xmax=x+h/2, ymin=y-w/2, ymax=y+w/2),
              fill="white",
              data=dat.labels) +
    geom_text(aes(label=label), data=dat.labels) +
    geom_text(aes(x=p.x, y=p.y, label=p.label), data=dat.labels) +
    theme_minimal() +
    theme(axis.text = element_blank(),
          axis.ticks=element_blank(),
          axis.title=element_blank(),
          panel.grid.major=element_blank(),
          panel.grid.minor=element_blank())


prob.tree +
    coord_cartesian(ylim=c(min(dat$y), max(dat$y))) +
    scale_y_continuous(limits=c(-.75, .75)) +
    annotate(geom="text",
             label = "P(SIDS) = 1/(8543x8543) = 1/73 million",
             x=1, y=-.7)

prob.tree +
    annotate(geom="text",
             label = "P(SIDS) = 1/(8543x8543) = 1/73 million",
             x=.01, y=-5,
             hjust=0) +
    annotate(geom="text",
             label = "P(Homicide) = 1/(21700x21700) = 1/471 million",
             x=.01, y=-6,
             hjust=0) +
    annotate(geom="text",
             label = "P(Homicide | deaths) = 1/((1/470890000)/(1/72982849)) = 1/6",
             x=.01, y=-7,
             hjust=0)



