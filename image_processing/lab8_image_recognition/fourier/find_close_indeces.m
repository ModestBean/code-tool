% Ѱ����״�ıպϱ߽�
function [new_indeces] = find_close_indeces(im_in)
[row, column] = find(im_in); % �õ���0Ԫ������
p = pdist([row column]); % ����ڶ������һ�еľ���ֵ���ο���https://blog.csdn.net/guanyuqiu/article/details/74331963
psqr = squareform(p); % ���õ���ֵת�ɷ�����ʽ���Խ���Ϊ0���ο���https://blog.csdn.net/guanyuqiu/article/details/74331963
row_length = length(row);
new_indeces = [row(1) column(1)]; % ��ʼָ��
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