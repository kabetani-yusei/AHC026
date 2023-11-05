require 'set'
n,m = gets.split.map &:to_i
box = m.times.map{gets.split.map &:to_i}
box = box.map{|x| x = x.reverse}
box_list = []
box_sum = 45#box0から9までの合計
for i in 0...n
    for j in 0...m
        for k in 0...box[j].size
            if box[j][k] == i+1
                box_list << j
            end
        end
    end
end
for i in 0...n
    for j in 0...m
        for k in 0...box[j].size
            if box[j][k] == i+1
                if k == 0
                    puts "#{i+1} 0"
                    box[j].shift
                else
                    next_box = (j+1)%m
                    uniq_list = Set.new()
                    uniq_list.add(j)
                    for l in i...n
                        uniq_list.add(box_list[l])
                        if uniq_list.size == m-1
                            next_box = box_sum - uniq_list.sum
                            break
                        end
                    end
                    if uniq_list.size != m-1
                        box_min = n+1
                        for l in 0...m
                            if !uniq_list.include?(l)
                                if box_min > box[l].size
                                    box_min = box[l].size
                                    next_box = l
                                end
                            end
                        end
                    end

                    puts "#{box[j][k-1]} #{next_box + 1}"
                    puts "#{i+1} 0" 
                    idou = box[j].slice(0...k)
                    box[j] = box[j].slice((k+1)...box[j].size)
                    box[next_box] = idou + box[next_box]
                end
            end
        end
    end
end