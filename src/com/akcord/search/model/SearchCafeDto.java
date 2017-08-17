package com.akcord.search.model;

public class SearchCafeDto {

	private String postdate;
	private String total;
	private String start;
	private String display;
	private String title;
	private String link;
	private String description;
	private String cafename;
	
	private int count;
	public int getCount() {
		return count;
	}

	public String getCafename() {
		return cafename;
	}

	public void setCafename(String cafename) {
		this.cafename = cafename;
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



	@Override
    public String toString() {
        return "blog [postdate=" + postdate + ", total=" + total + ", start=" + start + ", display=" + display + ", title=" + title
                + ", link=" + link + ", description=" + description + ", cafename=" + cafename
                +  "]";
    }



}

