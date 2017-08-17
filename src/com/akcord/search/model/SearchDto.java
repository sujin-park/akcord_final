package com.akcord.search.model;

public class SearchDto {

	private String postdate;
	private String total;
	private String start;
	private String display;
	private String title;
	private String link;
	private String description;
	private String bloggername;
	private String bloggerlink;
	private int count;
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getPostdate() {
		return postdate;
	}

	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBloggername() {
		return bloggername;
	}

	public void setBloggername(String bloggername) {
		this.bloggername = bloggername;
	}

	public String getBloggerlink() {
		return bloggerlink;
	}

	public void setBloggerlink(String bloggerlink) {
		this.bloggerlink = bloggerlink;
	}
	@Override
    public String toString() {
        return "blog [postdate=" + postdate + ", total=" + total + ", start=" + start + ", display=" + display + ", title=" + title
                + ", link=" + link + ", description=" + description + ", bloggername=" + bloggername + ", bloggerlink=" + bloggerlink
                +  "]";
    }



}

