#HW6 Part 1 for Math 510
#Instructor: Professor G

#Plot 1
require(ggplot2)
require(grid)
data("diamonds")
#call in the graphics drawing and layout packages we need
#call in the data Diamonds we are going to work with
p1<-ggplot(data=diamonds,mapping=aes(x=carat,y=price))+
    geom_point(aes(colour=factor(color)))+
    labs(title="Diamonds-Weight to Price by Color",x="Weight",y="Price")+
    theme(plot.title=element_text(colour="blue"))
print(p1)
#create a ggplot object respect to Diamonds,
#create a mapping with carat variable to x-axis,price varibale to y-axis
#data is display using scatter plot with color variable assigned to the color of dots
#set the main title to be "Diamonds-Weight to Price by Color"
#set "weight" and "price" to be x,y axis title respectively.

#Plot 2
require(ggplot2)
require(grid)
data("diamonds")
#call in the graphics drawing and layout packages we need
#call in the data Diamonds we are going to work with
p2<-ggplot(data=diamonds,mapping=aes(x=log(carat),y=log(price)))+
  geom_point(aes(colour=factor(color)))+
  labs(title="Diamonds-Weight to Price(Linear)",x="Weight",y="Price")+
  theme(plot.title=element_text(colour="blue"))
print(p2)
#create a ggplot object respect to Diamonds,
#create a mapping with carat variable's natural log value to x-axis,price varibale's natural log value to y-axis
#data is display using scatter plot with color variable assigned to the color of dots
#set the main title to be "Diamonds-Weight to Price by Color"
#set "weight" and "price" to be x,y axis title respectively.


#Plot 3
require("ggplot2")
require("grid")
require(gridExtra)
data("diamonds")
#call in the graphics drawing and layout packages we need
#call in the data Diamonds we are going to work with

d_new<-data.frame(diamonds)
#to keep the diamonds data frame intact, I assign diamonds to a new data frame
#and intend to do operations through this new data frame(I don't know it necessary or not)
m<-lm(log(price)~log(carat),data=d_new)
#get the linear model identifying how price changes as carat changes
d_new$rd<-residuals(m)
#create a new column(variable) rd in d_new to record the residule of log(price)
#my idea to is divide the screen view into 4 parts,3 ggplots and 1 blank square(left bottom)
p3<-ggplot(data=d_new,mapping=aes(x=log(carat),y=rd))+
  geom_point(aes(colour=factor(color)))+
  theme(legend.position="top",plot.title=element_text(colour="blue"))+
  guides(col=guide_legend(nrow=1,byrow=TRUE))+
  labs(title="Diamonds-Weight to Price by color",x="Weight",y="Price Residuals")
#create a ggplot p3 showing the scatter plot of weight and price and color identified by the dot's color
#set up the theme:the legend on the top and the main title's color set as blue
#set the main title to be "Diamonds-Weight to Price by Color"
#set "weight" and "price residuals" to be x,y axis title respectively.
d_pr<-ggplot(data=d_new,mapping=aes(x=price,fill=color))+
  geom_histogram(aes(y=..density..),position="stack")+
  theme(legend.position="none",axis.title.x = element_blank(), axis.title.y = element_blank())
#create a ggplot d_pr showing the density plot of price and color indicated by the dot's color
#set up the theme:no legend and no axis title
d_pr<-d_pr+coord_flip()+scale_y_reverse()
#make this plot rotate counter-clockwise by 90 degrees
d_cr<-ggplot(data=d_new,mapping=aes(x=carat,colour=color))+
  geom_histogram(aes(y=..density..),position="stack",fill="black")+
  theme(legend.position="none",axis.title.x = element_blank(), axis.title.y = element_blank())
#create a ggplot d_pr showing the density plot of weight and color indicated by the dot's color
#set up the theme:no legend and no axis title
blankplot <- ggplot()+geom_blank(aes(1,1))+
  theme(
    plot.background = element_blank(), 
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(), 
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.x = element_blank(), 
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.line = element_blank()
  )
#create a blank square
plot3<- grid.arrange(d_pr, p3, blankplot,d_cr, ncol = 2, nrow =2 ,
                      widths=c(1,4), heights=c(4,1))
print(plot3)
#divide the screenview into 4 part,two rows and two columns with the width ratio
#in the same row is 1:5 and height ratio in the same row is 5:1
#arrange the d_pr,p3,blankplot,d_cr into this four parts in sequence from row to column.
#finally output the plots 

####another way to display plot3
#The following way is from Professor G's instructions
#since I have run those three ggplots before,here I only put in the scripts concerning
#on the display of the three plots
grid.newpage()
pushViewport(viewport(layout=grid.layout(10,10)))
print(p3,vp=viewport(layout.pos.row =1:8,layout.pos.col =3:10))
print(d_pr,vp=viewport(layout.pos.row =7:8,layout.pos.col =3:7,angle=90))
print(d_cr,vp=viewport(layout.pos.row =9:10,layout.pos.col =3:10))
#divide the screen view into 10*10 grids display and these three plots by assigning those grids to them




#Plot 4
require("ggplot2")
require("grid")
require(gridExtra)
data("diamonds")
#call in the graphics drawing and layout packages we need
#call in the data Diamonds we are going to work with

d_new<-data.frame(diamonds)
#to keep the diamonds data frame intact, I assign diamonds to a new data frame
#and intend to do operations through this new data frame(I don't know it necessary or not)
m<-lm(log(price)~log(carat),data=d_new)
#get the linear model identifying how price changes as carat changes
d_new$rd<-residuals(m)
#create a new column(variable) rd in d_new to record the residule of log(price)
#my idea to is divide the screen view into 4 parts,3 ggplots and 1 blank square(left bottom)
p3<-ggplot(data=d_new,mapping=aes(x=log(carat),y=rd))+
  geom_point(aes(colour=factor(color)))+
  theme(legend.position="top",plot.title=element_text(colour="blue"))+
  guides(col=guide_legend(nrow=1,byrow=TRUE))+
  labs(title="Diamonds-Weight to Price by color",x="Weight",y="Price Residuals")
#create a ggplot p3 showing the scatter plot of weight and price and color identified by the dot's color
#set up the theme:the legend on the top and the main title's color set as blue
#set the main title to be "Diamonds-Weight to Price by Color"
#set "weight" and "price residuals" to be x,y axis title respectively.

d_pr<-ggplot(data=d_new,mapping=aes(x=price,fill=color))+
  geom_histogram(aes(y=..density..),position="stack")+
  theme(legend.position="none",axis.title.x = element_blank(), axis.title.y = element_blank())
#create a ggplot d_pr showing the density plot of price and color indicated by the dot's color
#set up the theme:no legend and no axis title

d_cr<-ggplot(data=d_new,mapping=aes(x=carat,colour=color))+
  geom_histogram(aes(y=..density..),position="stack",fill="black")+
  theme(legend.position="none",axis.title.x = element_blank(), axis.title.y = element_blank())
#create a ggplot d_pr showing the density plot of weight and color indicated by the dot's color
#set up the theme:no legend and no axis title

grid.newpage()
print(p3,vp=viewport(width=1,height=1))
print(d_pr,vp=viewport(x=0.3,y=0.3,width=0.4,height=0.3))
##why here need not upViewport()?When I put this clause, errors comeout.But
#logically I think it should return back to previous region
print(d_cr,vp=viewport(x=0.8,y=0.6,width=0.4,height=0.3))
#display three plots in the screen view by pushing three viewport,each with one plot.
#the placement of each was designated by setting those parameters values,x,y,width,height
#these values were obtained through by trial and error
