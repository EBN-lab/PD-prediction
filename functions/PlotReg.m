function  PlotReg(Y,Ypred,name)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[c,p]=corr(Y,Ypred);
po = polyfit(Y,Ypred,1);

fontsize=18;
lim =[min([Y ;Ypred]) max([Y ;Ypred])];
x=lim(1)-1:lim(2)+1;

percentage=0.95;

a=po(1);
b=po(2);
e=0.01;
itr=0;
fit=false;

while(~fit)
    nbofpoint=0;
    itr=itr+1;
    for i=1:length(Ypred)
        if(( Ypred(i) >= polyval([a (b-itr*e)],Y(i))) &&  ( Ypred(i) <= polyval([a (b+itr*e)],Y(i))))
            nbofpoint=nbofpoint+1;
        end
    end
    
    fit= nbofpoint > percentage*length(Ypred);
end

p1=[a b + itr*e];
p2=[a b - itr*e];
y1=polyval(p1,x);
y2=polyval(p2,x);
f = polyval(po,x);

plot(Y,Ypred,'ob',x,x,'.:k',x,f,'-r',x,y1,'m--',x,y2,'m--','MarkerSize',3,'LineWidth',3);
xlabel('Score','fontsize',fontsize,'fontweight','bold');
ylabel('Predicted score','fontsize',fontsize,'fontweight','bold');

axis([lim lim]);
legend('Predicted score','Y=X','Fit Predcited score','95% prediction','Location','northwest');
caption = sprintf ('%s R = %.3f' ,name,c);
title(caption, 'fontsize',fontsize );
end

