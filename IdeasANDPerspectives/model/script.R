source("./imagescale.R")
pal.1=colorRampPalette(c("blue","cyan","green","yellow","red"), space="rgb")

colors1<-c("darkblue","blue","cyan","lightgreen","green","yellow","orange",552,556,"brown")
colors2<-c("darkblue","cyan","green","orange",556,"brown")
palette1<-function(x){
        min<-range(gamma)[1];
        max<-range(gamma)[2];
        pos<-((x-min)/(max-min))*(length(colors1)-1);
        return(colors[pos+1]);
}

palette2<-function(x){
        min<-range(gamma)[1];
        max<-range(gamma)[2];
        pos<-((x-min)/(max-min))*(length(colors2)-1);
        return(colors[pos+1]);
}

files<-c("highhigh_randomlandscapes.dat","highhigh_seasonallandscapes.dat","highlow_randomlandscapes.dat","highlow_seasonallandscapes.dat");

parameters<-c("HighHigh-Random","HighHigh-Seasonal","HighLow-Random","HighLow-Seasonal");

for (f in 1:length(files)){

dat<-read.csv(files[f],sep=" ",header=FALSE);
G          <-dat[,1];
Prob_SL    <-dat[,2];
Prob_DL    <-dat[,3];
S          <-dat[,4];
J          <-dat[,5];
R_SRP      <-dat[,6];
mig_R      <-dat[,7];
H_SRP      <-dat[,8];
mig_H      <-dat[,9];
P_SRP      <-dat[,10];
mig_P      <-dat[,11];
gammaR     <-dat[,12];
gammaH     <-dat[,13];
gammaP     <-dat[,14];
gamma<-dat[,15];
varRadius  <-dat[,16];
meanRadius <-dat[,17];

breaks <- seq(min(gamma), max(gamma),length.out=100)

png(paste(files[f],"_meanRadius.png",sep=""),width=1366,height=768);
layout(matrix(c(1,2), nrow=2, ncol=1), widths=c(5,5), heights=c(5,1))
layout.show(2)
plot(Prob_DL,meanRadius,col=pal.1(length(breaks)-1),pch=15,main=parameters[f],xlab="Prob DL",ylab="Mean Radius",ylim=c(0,700),cex=2,cex.lab=1.7,cex.axis=2,cex.main=1.8);
par(mar=c(3,1,1,1))
image.scale(gamma, col=pal.1(length(breaks)-1), breaks=breaks, horiz=TRUE)
box()
dev.off();

png(paste(files[f],"_varRadius.png",sep=""),width=1366,height=768);
layout(matrix(c(1,2), nrow=2, ncol=1), widths=c(5,5), heights=c(5,1))
layout.show(2)
plot(Prob_DL,varRadius,col=pal.1(length(breaks)-1),pch=15,main=parameters[f],xlab="Prob DL",ylab="Var Radius",ylim=c(0,70000),cex=2,cex.lab=1.7,cex.axis=2,cex.main=1.8);
par(mar=c(3,1,1,1))
image.scale(gamma, col=pal.1(length(breaks)-1), breaks=breaks, horiz=TRUE)
box()
dev.off();

}
