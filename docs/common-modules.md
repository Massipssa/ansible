# Common modules

## file

- **lineinfile** : create, update, remove ... line in file

```yaml
lineinfile:
  dest: /path/to/file.txt
  line: Insert new line in a file
  state: present
  # create the file if not exists
  create: yes
```
