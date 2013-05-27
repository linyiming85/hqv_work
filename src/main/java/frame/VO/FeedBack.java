package frame.VO;

import java.sql.Date;

/**
 * Created with IntelliJ IDEA.
 * User: linyiming
 * Date: 13-5-22
 * Time: ����4:12
 * To change this template use File | Settings | File Templates.
 */
public class FeedBack {
    public String requireNo;
    public String staffId;
    public String content;
    public Date date;

    public String getRequireNo() {
        return requireNo;
    }

    public void setRequireNo(String requireNo) {
        this.requireNo = requireNo;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
