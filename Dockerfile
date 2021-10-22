FROM python:3.8-slim

ARG TAG

RUN apt update && \
    apt install -y git make

RUN cd /home && \
    git clone https://github.com/shingetsu/saku.git -b $TAG --depth 1

ENV HOME=/home/saku
WORKDIR $HOME

RUN pip install jinja2 Pillow MarkupSafe

CMD ["python", "./saku.py", "-v"]
