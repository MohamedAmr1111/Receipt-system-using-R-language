#Osama khaled mohamed 20106445
#mohamed amr saleh 20106990
print("Please select the database on which you wish to work on")
path = file.choose()
data = read.csv(path)
attach(data)
#attach(df2)
df = data.frame(
  Item = Item,
  Price = Price,
  counter = 0,
  TotalPrice=0
)
df2=df
attach(df)
print_fun = function()
{
  print("Enter The Item Code From 1 to 50")
  print("If You Finish Press 0")
}

print_fun2 = function(item)
{
  print_fun()
  for (i in 1:length(item)) {
    choise = as.integer(readline())
    if(choise == 0)
    {
      df2 = df[apply(df!=0 , 1 , all) , ]
      break
    }
    if(choise !=0 & choise <=50)
    {
      df[choise , 3] = df[choise,3]+1
      df[ , 4] = df[ , 2] * df[ , 3]
      print_fun()
    }
    if(choise >50)
    {
      print("The Number You Enter Is Incorrect")
      print_fun()
    }
  }
  print("Thanks")
  return(df2)
}

showing = function(df2)
{
  for(i in 1:nrow(df2))
  {
    print(paste(df2[i,3] ," x items  ",df2[i,1] , "       " , df2[i,4]))
  }
  
  MEAN = sum(df2$TotalPrice / sum(df2$counter))
  print(paste("Number Of Items = " , sum(df2$counter)))
  print(paste("Mean Price Of All Items = ", MEAN))
  print(paste("max item price = " , max(df2$Price)))
  print(paste("min item price = " , min(df2$Price)))
  print(paste("Required to pay = " , sum(df2$TotalPrice)))
}

df2 = print_fun2(Item)
showing(df2)
