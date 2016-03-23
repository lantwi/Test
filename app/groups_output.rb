class Groups

$big_array = []
#clean the data
def comma_file
  #pull data directly from file
  File.open("./data/comma.txt").each do |line|
    data= line.gsub(",","").split
    data.insert(4, data.delete_at(3))
    data.delete_at(2)
    data.insert(2, "M")
    $big_array.push(data)
  end
end

def pipe_file
  File.open("./data/pipe.txt").each do |line|
    data= line.gsub("|","").split
    data.delete_at(2)
    data.insert(4, data.delete_at(3))
    $big_array.push(data)
  end
end

def space_file
  File.open("./data/space.txt").each do |line|
    data = line.split(" ")
    data.delete_at(2)
    $big_array.push(data)
  end
end

#sort data
def out_put1(input)
  #group the gender
  grouped_by_gender = $big_array.group_by{|a| a[2]}
  #then sort according to gender
  sort_male = grouped_by_gender["M"].sort{|a,b| a[0] <=> b[0]},

  sort_female = grouped_by_gender["F"].sort{|a,b| a[0] <=> b[0]}

  #run conditional depending on gender
  if grouped_by_gender.include?("M")
    sort_male
  else
    sort_female
  end

end

#sort by dob
def out_put2(input)

  sort_dob = $big_array.sort_by{|a| a[4].reverse[0..3].reverse}
end

#sort by last name
def out_put3(input)
  pipe_file
  sort_name = $big_array.sort {|a,b| a[0] <=> b[0]}.reverse

end

end

print Groups.new.out_put2
