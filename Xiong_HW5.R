# HW5 for Math 510
# Instructor: Professor G

# Vectors:
# 1.Create Vectors
# (a)(1,2,3,...,19,20)
c(1:20)   
#print a vector from 1 to 20, ie. 1,2,3,4,5,```19,20
#c() is the code to create a vector            

# (b)(20,19,...,2,1)
c(20:1)
#print a vector from 20 back to 1
#c() is the code to create a vector

# (c)(1,2,3,...,19,20,19,18,...,2,1)
c(1:20,19:1)
#first, print the vector from 1 to 20, following from 19 to 1
#c() is the method to create a vector

# (d)(4,6,3)and assign it to the name tmp
tmp <-c(4,6,3)  
tmp
#first assign a vector "tmp", and then initial this vector with value (4,6,3)
#<- is the assignment symbol with < pointing to the variable

#(e)(4,6,3,4,6,3,...,4,6,3)where there are 10 occurences of 4.
rep(tmp,10) 
#create a vector in which 4,6,3 repeating for ten times
#rep(x,n) creates a vector with reapeting x for n times

#(f)(4,6,3,4,6,3,...,4,6,3)where there are 11 occurences of 4,10 occurences of 6 and 10 occurrences of 3.
## Prof G: Not generalized. Have to know what's
##         contained in tmp. rep(tmp, l=31) is better.
c(rep(tmp,t=10),4)         
#first repeat (4,6,3) for ten times and add 4 to make 11 occurences of 4 in this vector

#(g)(4,4,...,4,6,6,...,6,3,3,...,3)where there are 10 occurrences of 4,20 occurrences of 6 and 30 occurrences of 3.
rep(tmp,c(10,20,30))  
#create a vector in which 4 repeating 10 times,6 repeating 20 times and 3 repeating for 30 times
#rep(x,y) create a vector with repeating each element in x for several times indicated by corresponding element in vector y

#2.Creat a vector of the values of e^x*cos(x) at x=3,3.1,3.2,...,5.9,6.
x<-seq(3,6,0.1)        
#give x a number sequence starting from 3,increasing 0.1 each time and ending in 6.0
exp(x)*cos(x)          
#get a sequence answer on function exp(x)*cos(X) on defined x

#3.Create the following vectors
#(a)(0.1^3*0.2^1, 0.1^6*0.2^4, 0.1^9*0.2^7,...,0.1^36*0.2^34)
a<-seq(3,36,3)        
#create a to indicate the power of 0.1 in each element  
#a is a sequence starting from 3,increasing 3 each step and ending in 36
b<-seq(1,34,3)       
#create b to indicate the power of 0.2 in each element
#b is a sequence starting from 1,increasing 3 each step and ending in 34
0.1^a*0.2^b
#get the sequence answer of this function given a, b

#(b)(2,2^2/2,2^3/3,...,2^25/25)
s<-c(1:25)
#define a sequence s (1,2,3,```,25)
2^s/s
#do exponential and division operations term by term in s
#the final result is a sequence (2,2^2/2,2^3/3,...,2^25/25)

#4.Calculate the following:
#(a)
p<-seq(10,100,by=1)     
#create an integer number sequence from 10 to 100
sum(p^3+4*p^2)          
#do the same operation to each number and then use sum() to add them up
#the final result is a number

#(b)
q=seq(1,25,by=1)
#create an integer number sequence from 1 to 25
sum(2^q/q+3^q/(q^2))
#do the same operation with each number and then use sum() to add them up
#the final result is a number

#5.Use the function paste to create the following character vectors of length30
#(a)
paste("label",1:30,sep=" ")     
#concatenate "label" and numbers 1 to 30 term by term with space seperating them
#the result is ("label 1","label 2","label 3"..."label 30")

#(b)
paste("fn",1:30,sep="")         
#concatenate "fn" and numbers 1 to 30 term with no seperator between
#the result is ("fn1","fn2","fn3"..."fn30")

#6

set.seed(50)
xVec<-sample(0:999,250,replace=T)
yVec<-sample(0:999,250,replace=T)
#create two vectors of random integers which are chosen with replacement from the integers 0,1,```,999. Both vectors have length 250

#(a)
yVec[-1]-xVec[-length(xVec)]     
#remove the first element in yVec and the last in xVec,and then do vector deduction

#(b)
sin(yVec[-length(yVec)])/cos(xVec[-1])  
#remove the last element from yVec and the first element from xVec
#then do sine and cosine operations to modified vectors term by term and get a final sequence

#(c)
i=seq(1,248)                      
#generate a number sequence from 1 to 248 as index vector for the following operations
xVec[i]+2*xVec[i+1]-xVec[i+2]   
#get a sequence in which the nth value is [the nth value in xVec] plus doubled [the (n+1)th value in xVec] minus [the (n+2)th value in xVec] where n=1,2,3,```,248.

#(d)
i=seq(1,249)                      
#generate a number sequence from 1 to 249 as index vector for the following operations
sum(exp(-xVec[i+1])/(xVec[i]+10))  
#get a new sequence: the nth value is exp(-[the (n+1)th value in xVec]) divide by [the nth value in xVec plus 10] where n=1,2,3,```,249.
#add the new sequence up to get the sum

#7.This question uses the vectors xVec and yVec created in the previous question and the functions sort,order, mean, sqrt, sum and abs
#(a)
yVec[yVec>600]
#get all the values in the vector yVec that are greater than 600

#(b)
which(yVec>600)
#get the index positions in yVec of the values which are >600


#(c)	
xVec[which(yVec>600)]
#get the	values in	xVec which correspond	to the values	in yVec which	are	>	600


#(d)
sqrt(abs(xVec-mean(xVec)))
#get the square root of the difference between each element and their mean in xVec

#(e)
sum(yVec>(max(yVec)-200))     
#yVec>(max(yVec)-200) creates a logical vector which is 1(True) when the element is within 200 of the maximum
#add this logical vector up to get the number of values	in	yVec that	are	within	200	of	the	maximum	value

#(f)
sum(xVec%%2==0)               
#xVec%%2==0 creates a logical vector which is 1(True) when the element is divisible by 2
#add this logical vector up to get the even numbers in xVec

#(g)
xVec[order(yVec)]            
#order(yVec) create the index vector of rearranged yVec in ascending order
#then get a new vector of the numbers in	the	vector xVec	with index corresponding to ascending yVec

#(h)
yVec[seq(1,250,by=3)] 
#first create a sequence 1,4,7,10,13,?K
#pick out the elements in yVec	at index positions 1,4,7,10,13,?K

#8.By using the function cumproud or otherwise, calculate:
m=seq(2,38,by=2)
n=seq(3,39,by=2)
1+sum(cumprod(m)/cumprod(n))
#create a sequence m 2,4,6,8...all even numbers to 38
#create a sequence n 3,5,7,9...all odd numbers to 39
#cumprod() returns a sequence which is cumultive products of each factor
#get a new sequence by dividing m's cumultive sequence by n's term by term and add this new sequence up
#add 1 to the aboving sum value
