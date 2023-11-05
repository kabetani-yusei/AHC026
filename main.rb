n,m = gets.split.map &:to_i
box = m.times.map{gets.split.map &:to_i}
box = box.map{|x| x = x.reverse}
for i in 0...n
    for j in 0...m
        for k in 0...box[j].size
            if box[j][k] == i+1
                if k == 0
                    puts "#{i+1} 0"
                    box[j].shift
                else
                    puts "#{box[j][k-1]} #{(j+1)%m + 1}"
                    puts "#{i+1} 0" 
                    idou = box[j].slice(0...k)
                    box[j] = box[j].slice((k+1)...box[j].size)
                    box[(j+1)%m] = idou + box[(j+1)%m]
                end
            end
        end
    end
end