ADD hello.py /home/hello.py
RUN yum install python3 -y
CMD ["/home/hello.py"]
ENTRYPOINT ["python3"]
