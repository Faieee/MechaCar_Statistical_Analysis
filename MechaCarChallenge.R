library(dplyr)

# mpg analysis
mecha_mpg <- read.csv('data/MechaCar_mpg.csv')

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_mpg)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_mpg))

# suspension coil analysis
suspension <- read.csv('data/Suspension_Coil.csv')

total_summary <- suspension %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))
lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

# suspension coil t-tests
t.test(suspension$PSI, mu=1500)
t.test(subset(suspension, Manufacturing_Lot=='Lot1')$PSI, mu=1500)
t.test(subset(suspension, Manufacturing_Lot=='Lot2')$PSI, mu=1500)
t.test(subset(suspension, Manufacturing_Lot=='Lot3')$PSI, mu=1500)