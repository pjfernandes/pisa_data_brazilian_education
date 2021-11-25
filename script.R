matematica<-c(334,356,370,386,389,377,384)
ciencias<-c(375,390,390,405,402,401,404)
leitura<-c(396,403,393,412,407,407,413)

library(Kendall)

MannKendall(matematica)
MannKendall(ciencias)
MannKendall(leitura)


x<-c(2000,2003,2006,2009,2012,2015,2018)
y<-matematica
z<-ciencias
t<-leitura

ocde_mat<-c(NA,499,494,495,494,490,489)
ocde_cie<-c(NA,NA,498,501,501,493,489)
ocde_leitura<-c(493,494,489,493,496,493,487)

media<-numeric()

for (i in 1:length(ocde_mat)) {
  media_rodada<-mean(c(ocde_mat[i],ocde_cie[i],ocde_leitura[i]))
  media<-c(media,media_rodada)
  
}


resultado2<-data.frame(x=x,y=y,z=z,t=t,w=media)

fig <- plot_ly(resultado2, x = x, y = y, type = 'scatter', mode = 'lines',line = list(color = 'orange',dash = F, width = 2),name = 'Matem?tica')
fig <- fig %>% add_trace(y = ~z,line = list(color = 'rgb(205, 12, 24)', width = 3,dash = F),name = 'Ci?ncias')
fig <- fig %>% add_trace(y = ~t,line = list(color = 'green', width = 3,dash = F),name = 'Leitura')
fig <- fig %>% add_trace(y = ~w,line = list(color = 'white', width = 3,dash = 'dash'),name = 'M?dia OCDE (2006-2018)')

fig <- fig %>% layout(legend = list(x = 0.013, y = 0.98),plot_bgcolor='rgb(25,25,25)', paper_bgcolor='rgb(0, 0, 0)',
                      yaxis = list(title="Pontua??o PISA",zeroline = T, tickfont = list(size = 26,color = 'rgba(255, 255, 255, .9)'), titlefont = list(size = 26,color = 'rgba(255, 255, 255, .9)')),
                      xaxis = list(title="",zeroline = T,tickfont = list(size = 26,color = 'rgba(255, 255, 255, .9)'),titlefont = list(size = 26,color = 'rgba(255, 255, 255, .9)')))

fig

#######################################
df<-read.csv('C:/data.txt',sep="\t",h=T)

df<-df[order(df$Leitura,decreasing = F),]

fig2 <- plot_ly(
  x = df[,1],
  type = "bar",
  orientation = 'h',
  marker = list(color = 'rgb(205, 12, 24)',
                line = list(color = 'black',
                            width = 1.5))
)

fig2 <- fig2 %>% layout(showlegend = FALSE,plot_bgcolor='rgb(25,25,25)', paper_bgcolor='rgb(0, 0, 0)',
                      yaxis = list(title="",zeroline = T, tickfont = list(size = 26,color = 'rgba(255, 255, 255, .9)'), titlefont = list(size = 26,color = 'rgba(255, 255, 255, .9)')),
                      xaxis = list(title="Pontua??o",zeroline = T,tickfont = list(size = 26,color = 'rgba(255, 255, 255, .9)'),titlefont = list(size = 26,color = 'rgba(255, 255, 255, .9)')))

fig2

fig2 %>% add_segments(x = 413, xend = 0, y = 20, yend = 20,line=list(color='white'),marker=list(color='white'))


