import os
import glob
import re
from jinja2 import Template, Environment, FileSystemLoader


env = Environment(loader=FileSystemLoader('./templates'))
template = env.get_template('index.html.j2')

path = './tracklists/'
items = []

for i in os.listdir(path):
  item = {}
  item['name'] = re.findall('mix-(.+).html', i)[0]
  item['url'] = path + i
  item['genre'] = re.findall('mix-(\D+)\d+.html', i)[0]
  items.append(item)

genres = sorted(set([i['genre'] for i in items]))
data = {}

for genre in genres:
  data[genre] = []
  for i in items:
    if i['genre'] == genre:
      data[genre].append(i)

render_data = {
  "data": data,
  "genres": genres
}

rendered = template.render(render_data)

print(str(rendered))