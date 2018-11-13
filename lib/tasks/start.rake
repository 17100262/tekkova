task :start do 
    p "=> Starting Rails + PG Server "
    Process.exec("sudo service postgresql start \n rails s -p $PORT -b $IP")
end
task :rails do 
    Process.exec("rails s -p $PORT -b $IP")
end
task :pg do 
    Process.exec("sudo service postgresql start")
end