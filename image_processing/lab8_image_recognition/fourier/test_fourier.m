% create the matrix
shapes=4;

switch shapes
    case 1%square
        m=zeros(500);
        m(50:450,50)=1;m(50:450,450)=1;
        m(50,50:450)=1;m(450,50:450)=1;
    case 2%cross
        m=zeros(400);
        m(40,190:210)=1;
        m(40:190,190)=1; m(40:190,210)=1; m(190:210,40)=1;
        m(190,40:190)=1;m(190,210:360)=1; m(190:210,360)=1;
        m(210,40:190)=1;m(210,210:360)=1;
        m(210:360,190)=1; m(210:360,210)=1;
        m(360,190:210)=1;
    case  3%alphabet F
        m=zeros(300);
        m(60,100:200)=1;
        m(60:260,100)=1;
        m(160,100:200)=1;
    case 4%vertical rectangular
        m=zeros(500);
        m(50:450,200)=1;m(50:450,300)=1;
        m(50,200:300)=1;m(450,200:300)=1;
    case 5%horizontal rectangular
        m=zeros(500);
        m(200:300,50)=1;m(200:300,450)=1;
        m(200,50:450)=1;m(300,50:450)=1;
end


[border_fft,border_restored,xx,yy]=make_fft_sec(m,10);

figure(1),imshow(~m),title('original');
figure(2),imshow(~m),hold on;plot((xx),yy,'ro'),title('reconstructed points(red circles)');
figure(3),imshow(~border_restored),title('reconstruction figure');
