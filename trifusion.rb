def fusion(array, first, middle, last)
  i   = first
  j   = middle + 1
  pro = []

  while (i <= middle && j <= last)
    if array[i] <= array[j]
      pro.push(array[i])
      i += 1
    else
      pro.push(array[j])
      j += 1
    end
  end

  while (i <= middle)
    pro.push(array[i])
    i += 1
  end

  while (j <= last)
    pro.push(array[j])
    j += 1
  end

  limit = last - first
  for k in 0..limit
    array[first + k] = pro[k]
  end
  array
end

def triFusionRec(array, first, last, level)
  level += 1

  return if first >= last

  middle = (first + last) / 2

  triFusionRec(array, first, middle, level)
  triFusionRec(array, middle + 1, last, level)

  fusion(array, first, middle, last)
end

def triFusion(array)
  triFusionRec(array, 0, array.count - 1, 0)
end

my_array = [7, 5, 14, 4, 10, 2, 8]

p my_array

my_array = triFusion(my_array)

p my_array