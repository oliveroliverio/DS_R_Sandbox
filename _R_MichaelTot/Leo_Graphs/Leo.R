
require(plotly)

#Linear Models 20170328
SSF0328 <- read.csv("20170328_SSF_Max_Mean.csv")
UHTS <- read.csv("ABCG5G8_UHTS_Max_Mean.csv")
SSF0328_UHTS <- merge(SSF0328, UHTS, by = "Compound.ID")

par(mfrow=c(2,2))
SSF0328_UHTS.lm <- lm(data = SSF0328_UHTS, Norm.Max.SSF ~ Max.Activity.UHTS)
plot(SSF0328_UHTS.lm)
summary(SSF0328_UHTS.lm)

glm(data = SSF0328_UHTS, y ~  x1 * x2 * x3 + x2:x3 + x1:x3, family=binomial(link='logit'))


require(ggplot2)



#compounds 12 (601224) and 15 (830027) have high Cook's Values, rm them and try again
SSF0328_UHTS2 <- SSF0328_UHTS[-15,]
SSF0328_UHTS2 <- SSF0328_UHTS2[-12,]

SSF0328_UHTS.lm2 <- lm(data = SSF0328_UHTS2, Norm.Max.SSF ~ Max.Activity.UHTS)
plot(SSF0328_UHTS.lm2)
summary(SSF0328_UHTS.lm2)

par(mfrow=c(1,1))



#Linear Models 20170330
SSF0330 <- read.csv("20170330_SSF_Max_Mean.csv")
UHTS <- read.csv("ABCG5G8_UHTS_Max_Mean.csv")
SSF0330_UHTS <- merge(SSF0330, UHTS, by = "Compound.ID")

SSF0330_UHTS.lm <- lm(data = SSF0330_UHTS, Max.SSF ~ Max.Activity.UHTS)
plot(SSF0330_UHTS.lm)
summary(SSF0328_UHTS.lm)
#compounds 1 (830027) have high Cook's Values, rm them and try again
SSF0330_UHTS2 <- SSF0330_UHTS[-1,]
SSF0330_UHTS2 <- SSF0330_UHTS2[-13,]
SSF0330_UHTS2 <- SSF0330_UHTS2[-13,]

SSF0330_UHTS.lm2 <- lm(data = SSF0330_UHTS2, Max.SSF ~ Max.Activity.UHTS)
plot(SSF0330_UHTS.lm2)
summary(SSF0330_UHTS.lm2)







