
clc,clear;     
 
I=imread('cameraman.tif'); 
 
BW=edge(I,0.1);           
 

theta=0:179;                
[R,rho]=radon(BW,theta);   
M=length(rho);N=length(theta); 
                          

figure,imagesc(theta,rho,R);     
colormap(hot); 
xlabel('\theta(????)'); 
ylabel('\rho(???)'); 
colorbar 
 
X=13;   
nhood=11;   
for j=1:X 
    [Rmax(1,j),RANK]=max(R(:));
    yRmax=floor(RANK/M)+1; xRmax=mod(RANK,M); 
    Rmax(2,j)=yRmax;
    Rmax(3,j)=rho(xRmax);
%   R(RANK)=0;? 
    for xi=-floor(nhood/2):floor(nhood/2)
        for yi=-floor(nhood/2):floor(nhood/2) 
            xx=xRmax+xi;yy=yRmax+yi; 
            if xx>0&xx<=M&yy>0&yy<=N 
                R(xx,yy)=0; 
            end 
        end 
    end 
end 
hold on 
plot(Rmax(2,:),Rmax(3,:),'linestyle','none','marker','s','color','b')
hold off 
 
%??????? 
Rmax(2,:)=(Rmax(2,:)-1)/180*pi;
Im1=BW;Im2 = BW; 
for i=1:X 
    plot([p1(2),p2(2)],[p1(1),p2(1)],'Color','r','LineWidth',2)
    Im1=DrawLineR(Im1,Rmax(2,i),Rmax(3,i));
    Im2=DrawLineS(Im2,Rmax(2,i),Rmax(3,i));
end 

subplot(2, 2, 1),imshow(Im1); 
subplot(2, 2, 2),imshow(Im2)