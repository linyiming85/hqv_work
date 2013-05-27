package frame.VO;

/**
 * Created with IntelliJ IDEA.
 * User: linyiming
 * Date: 13-5-21
 * Time: ����10:53
 * To change this template use File | Settings | File Templates.
 */
public class RequireStaff {
    public int requireNo;
    public String staffRole;
    public String staffId;
    public String provinceBranch;

    public String getProvinceBranch() {
        return provinceBranch;
    }

    public void setProvinceBranch(String provinceBranch) {
        this.provinceBranch = provinceBranch;
    }

    public int getRequireNo() {
        return requireNo;
    }

    public void setRequireNo(int requireNo) {
        this.requireNo = requireNo;
    }

    public String getStaffRole() {
        return staffRole;
    }

    public void setStaffRole(String staffRole) {
        this.staffRole = staffRole;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }
}
