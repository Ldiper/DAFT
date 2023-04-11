function yn = daft_h(yn,pstw,m)
    for j = 1:m:size(yn,1)
        npstw=pstw(j);
        for i = j:j+m-1
            if i > size(yn,1)
                break
            end
            npstw=npstw+yn(i);
            yn(i)=npstw;
        end
    end
end

