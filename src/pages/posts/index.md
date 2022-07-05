---
setup: |
  import Layout from '../../layouts/BlogPost.astro'
  import Cool from '../../components/Author.astro'
title: Hello world!
publishDate: 5 Jul 2022
author:
  name: Aleks Rutins
  href: https://aleks.rutins.com
---
This is a blog! It's written using [Astro](https://astro.build). I'll generally try to write stuff here - programming-related stuff, for the most part.

A test of syntax highlighting:
```swift
struct ContentView: View {
  var body : some View {
    Text("Hello, World!")
  }
}
```