function [nghiem] = lap(f,flap,a,b,solanlap)
syms x; 
fd1 = str2func(['@(x)' char(diff(f(x)))]);
fd2 = str2func(['@(x)' char(diff(fd1(x)))]);
nostop = 1;
temp1 = double(solve(diff(f(x))));
temp2 = double(solve(diff(fd1(x))));
%Kiem tra f'(x) co doi dau trong khoang phan li nghiem hay khong
if ~isempty(temp1)
    for i=1:length(temp1)
        if (temp1(i)<=b) && (temp1(i)>=a)
            disp('Ham f'' doi dau trong khoang phan li nghiem');
            nostop=0;
            nghiem = 'khong xac dinh';
%            solanlap = 'khong xac dinh';
            break;
        end
    end
end
%Kiem tra f"(x) co doi dau trong khoang phan li nghiem hay ko
if ~isempty(temp2)
    for i=1:length(temp2)
        if (temp2(i)<=b) && (temp2(i)>=a)
            disp('Ham f" doi dau trong khoang phan li nghiem');
            nostop=0;
            nghiem = 'khong xac dinh';
%            solanlap = 'khong xac dinh';
            break;
        end
    end
end
if (nostop)
    x1=b;
    x0=a;
    for i=1:1:solanlap
        x1=flap(x0);
        x0=x1;
        nghiem = x1;

%    e=abs(x1-x0);
%     if e<saiso
%             nghiem=x1;
% %            solanlap=i;
%             break
%     else 
%         x0=x1;
%     end
    end 
end % ket thuc function






