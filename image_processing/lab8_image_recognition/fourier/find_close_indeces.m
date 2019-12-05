% 寻找形状的闭合边界
function [new_indeces] = find_close_indeces(im_in)
[row, column] = find(im_in); % 得到非0元素索引
p = pdist([row column]); % 计算第二列与第一列的距离值，参考：https://blog.csdn.net/guanyuqiu/article/details/74331963
psqr = squareform(p); % 将得到的值转成方阵形式，对角线为0，参考：https://blog.csdn.net/guanyuqiu/article/details/74331963
row_length = length(row);
new_indeces = [row(1) column(1)]; % 初始指标
ind_ind_data = 1; 
newind = 1;
for ind = 2 : row_length
    mcur_dist = psqr(newind, : );
    [~, dist_min_ind] = sort(mcur_dist);
    [~, inddmin] = setdiff(dist_min_ind, ind_ind_data);
    dist_min_ind = dist_min_ind(sort(inddmin));
    newind = dist_min_ind(1);
    new_indeces = [new_indeces; [row(newind) column(newind)]];
    ind_ind_data = [ind_ind_data; newind];
    lenindata = length(ind_ind_data);
end