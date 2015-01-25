# BlogApp
Yet another cool blog application.

## GEMS used
1. sinatra
2. rspec
3. rack & rack-test
4. sass	

## Usage
Clone the repository, navigate to /BlogApp/sinatra and run the app.rb
```
$ ruby app.rb
```

## Routes
Path | Method | Description |
--- | --- | --- 
/ | GET | Index Page (Display tags by popularity) 
/posts/:id | GET | Display post with :id 
/author/:author | GET | Post(s) written by :author 
/tags/:tag | GET | Post(s) tagged with :tag 

## Tests
Run RSpec from the /BlogApp folder
```
$ rspec spec
```