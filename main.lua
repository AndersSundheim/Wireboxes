function gen()
  x1 = math.random(0,700)
  y1 = math.random(0,400)
  w1 = math.random(20,100)
  h1 = math.random(20,100)
  fail = false
  for i=1,#r do
    if r[i].x==nil or (x1>=r[i].x and x1<=(r[i].x+r[i].w)) or (x1+w1>=r[i].x and x1+w1<=(r[i].x+r[i].w))or (x1<=r[i].x and x1+w1>=r[i].x+r[i].w)then
      print('fail')
      fail = true
    end
  end
  if fail == true then
    return nil
  end
  return {xx = x1, yy = y1, ww = w1, hh = h1}
end
function love.load( arg )
	l={}
  r = {}
  start = false
  math.randomseed(os.clock()*100000000000)
  for i=1,10 do  
    t = gen()
    if t~=nil then
      table.insert(r,{x=t.xx,y=t.yy,w=t.ww,h=t.hh})
      
    end  
  end
  temp = r
  local function tableSort(a,b)
  return a.x < b.x
end

table.sort( r, tableSort)
  for i=1,#r-1 do
    print(r[i].x)
      rs = math.random(2)
      if rs==2 then
        --table.insert(l,{x1=r[i].x+r[i].w,y1=r[i].y+(r[i].h/2),x2=r[i+1].x,y2=r[i+1].y+(r[i+1].w/2)})
        table.insert(l,{x1=r[i].x+r[i].w,y1=r[i].y+(r[i].h/2),x2=(r[i].x+r[i].w)+(0.5*(r[i+1].x-(r[i].x+r[i].w))),y2=r[i].y+(r[i].h/2)})
        table.insert(l,{x1=(r[i].x+r[i].w)+(0.5*(r[i+1].x-(r[i].x+r[i].w))),y1=r[i].y+(r[i].h/2),x2=(r[i].x+r[i].w)+(0.5*(r[i+1].x-(r[i].x+r[i].w))),y2=r[i+1].y+(r[i+1].h/2)})
        table.insert(l,{x1=(r[i].x+r[i].w)+(0.5*(r[i+1].x-(r[i].x+r[i].w))),y1=r[i+1].y+(r[i+1].h/2),x2=r[i+1].x,y2=r[i+1].y+(r[i+1].h/2)})
      end
      if rs==1 then
        if r[i].y+((r[i].y+r[i].h)/2)<r[i+1].y then
        table.insert(l,{x1=r[i].x+r[i].w,y1=r[i].y+(r[i].h/2),x2=(r[i].x+r[i].w)+((r[i+1].x-(r[i].x+r[i].w)))+(((r[i+1].x+r[i+1].w)-r[i+1].x)/2),y2=r[i].y+(r[i].h/2)})
        table.insert(l,{x1=(r[i].x+r[i].w)+((r[i+1].x-(r[i].x+r[i].w)))+(((r[i+1].x+r[i+1].w)-r[i+1].x)/2),y1=r[i].y+(r[i].h/2),x2=r[i+1].x+(((r[i+1].x+r[i+1].w)-r[i+1].x)/2),y2=r[i+1].y})
      end
      if r[i].y+((r[i].y+r[i].h)/2)>r[i+1].y then
          --table.insert(l,{x1=r[i].x+(0.5*((r[i].x+r[i].w)-r[i].x)),y1=r[i].y+r[i].h,x2=r[i].x+(0.5*((r[i].x+r[i].w)-r[i].x)),y2=r[i+1].y+(r[i+1].h/2)})
          table.insert(l,{x1=r[i].x+r[i].w,y1=r[i].y+(r[i].h/2),x2=(r[i].x+r[i].w)+(0.5*(r[i+1].x-(r[i].x+r[i].w))),y2=r[i].y+(r[i].h/2)})
        table.insert(l,{x1=(r[i].x+r[i].w)+(0.5*(r[i+1].x-(r[i].x+r[i].w))),y1=r[i].y+(r[i].h/2),x2=(r[i].x+r[i].w)+(0.5*(r[i+1].x-(r[i].x+r[i].w))),y2=r[i+1].y+(r[i+1].h/2)})
        table.insert(l,{x1=(r[i].x+r[i].w)+(0.5*(r[i+1].x-(r[i].x+r[i].w))),y1=r[i+1].y+(r[i+1].h/2),x2=r[i+1].x,y2=r[i+1].y+(r[i+1].h/2)})
      end
    end
  end
  start = true
end

function love.draw()
  if start == true then
    for j=1,#r do
      if r[j].x~=nil then
        love.graphics.rectangle('line',r[j].x,r[j].y,r[j].w,r[j].h)
    end
    for i=1,#l do
      love.graphics.line(l[i].x1,l[i].y1,l[i].x2,l[i].y2)
    end
    
  end
  end
end
