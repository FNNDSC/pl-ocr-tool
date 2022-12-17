# Docker file for ocr_tool ChRIS plugin app
#
# Build with
#
#   docker build -t <name> .
#
# For example if building a local version, you could do:
#
#   docker build -t local/pl-ocr_tool .
#
# In the case of a proxy (located at 192.168.13.14:3128), do:
#
#    docker build --build-arg http_proxy=http://192.168.13.14:3128 --build-arg UID=$UID -t local/pl-ocr_tool .
#
# To run an interactive shell inside this container, do:
#
#   docker run -ti --entrypoint /bin/bash local/pl-ocr_tool
#
# To pass an env var HOST_IP to container, do:
#
#   docker run -ti -e HOST_IP=$(ip route | grep -v docker | awk '{if(NF==11) print $9}') --entrypoint /bin/bash local/pl-ocr_tool
#

FROM python:3.9.1-slim-buster
LABEL maintainer="codificat <pep@redhat.com>"

WORKDIR /usr/local/src

#RUN apt update && apt-get -y install tesseract-ocr
# install languages (separete layer to allow for updating without having to rebuild everything)

#RUN apt-get -y install tesseract-ocr-nld tesseract-ocr-spa 
RUN pip install paddlepaddle
#RUN python -m pip install pillow
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install wget


COPY . .
RUN mkdir test_txt
RUN pip install .


# Jennings suggestion
ENV HOME=/MODELS

# run the program once to make it download the data it needs
RUN ocr_tool ./test_img /tmp --lang ch
RUN ocr_tool ./test_img /tmp --lang en
RUN ocr_tool ./test_img /tmp --lang fr
RUN ocr_tool ./test_img /tmp --lang german
RUN ocr_tool ./test_img /tmp --lang japan
RUN ocr_tool ./test_img /tmp --lang korean
RUN ocr_tool ./test_img /tmp --lang es
RUN ocr_tool ./test_img /tmp --lang ru
RUN ocr_tool ./test_img /tmp --lang pt

RUN chmod -R 777 $HOME

#CMD ["ocr_tool", "--help"]
#CMD ["ocr_tool", "--lang","ch"]


#RUN mkdir /.paddleoce && 
#RUN chmod 777 /.paddleocr
#ENV HOME=/.paddleocr



#ENV HOME=/tmp

#RUN wget https://paddleocr.bj.bcebos.com/PP-OCRv3/chinese/ch_PP-OCRv3_det_infer.tar -O /tmp/.paddleocr/whl/det/ch/ch_PP-OCRv3_det_infer/ch_PP-OCRv3_det_infer.tar
#RUN wget https://paddleocr.bj.bcebos.com/PP-OCRv3/chinese/ch_PP-OCRv3_rec_infer.tar -O /tmp/.paddleocr/whl/rec/ch/ch_PP-OCRv3_rec_infer/ch_PP-OCRv3_rec_infer.tar
# RUN wget https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_cls_infer.tar -O /tmp/.paddleocr/whl/cls/ch_ppocr_mobile_v2.0_cls_infer/ch_ppocr_mobile_v2.0_cls_infer.tar


