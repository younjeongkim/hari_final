package com.smhrd.hari.dto;

public class PagingDTO {
    private int nowPage = 1;
    private int onePageRecord = 5;
    private int totalRecord;
    private int totalPage;

    private int onePageNumCount = 5;
    private int startPageNum = 1;

    private int lastPageRecord = 5;

    private String searchKey;
    private String searchWord;
    private int offset;

    public int getOffset() {
        return offset;
    }

    public int getNowPage() {
        return nowPage;
    }

    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;

        startPageNum = ((nowPage - 1) / onePageNumCount) * onePageNumCount + 1;

        this.offset = (nowPage - 1) * onePageRecord;
    }

    public int getOnePageRecord() {
        return onePageRecord;
    }

    public void setOnePageRecord(int onePageRecord) {
        this.onePageRecord = onePageRecord;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;

        totalPage = (int) Math.ceil((double) totalRecord / onePageRecord);
        lastPageRecord = onePageRecord;

        if (totalPage == nowPage) {
            if (totalRecord % onePageRecord != 0) {
                lastPageRecord = totalRecord % onePageRecord;
            }
        }

        System.out.println("lastPageRecord => " + lastPageRecord);
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getOnePageNumCount() {
        return onePageNumCount;
    }

    public void setOnePageNumCount(int onePageNumCount) {
        this.onePageNumCount = onePageNumCount;
    }

    public int getStartPageNum() {
        return startPageNum;
    }

    public void setStartPageNum(int startPageNum) {
        this.startPageNum = startPageNum;
    }

    public int getLastPageRecord() {
        return lastPageRecord;
    }

    public void setLastPageRecord(int lastPageRecord) {
        this.lastPageRecord = lastPageRecord;
    }

    public String getSearchKey() {
        return searchKey;
    }

    public void setSearchKey(String searchKey) {
        this.searchKey = searchKey;
    }

    public String getSearchWord() {
        return searchWord;
    }

    public void setSearchWord(String searchWord) {
        this.searchWord = searchWord;
    }
}
