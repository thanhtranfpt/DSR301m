library(httr)

cookies <- c("ASP.NET_SessionId" = "djwvreeuqtgxhsrwlh1zlpqr")
url <- "https://fap.fpt.edu.vn/Report/ScheduleOfWeek.aspx"
response <- GET(url, set_cookies(cookies))
content = content(response, "text")
content

library(rvest)

content = content(response, "text")

html <- read_html(content)

tables = html_nodes(html,'table')

timetable = html_table(tables[3])
timetable

timetable <- as.data.frame(timetable)
timetable[1,1] <- "Slot"
colnames(timetable)[1] <- "Weekday"
timetable
write.csv(timetable, file = "K:\\LEARN AI FPT\\TERM 5\\DSR301m\\DSR301m\\timetable.csv", row.names = FALSE)
