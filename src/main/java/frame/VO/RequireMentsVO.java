package frame.VO;

/**
 * Created with IntelliJ IDEA.
 * User: linyiming
 * Date: 13-5-21
 * Time: ����2:07
 * To change this template use File | Settings | File Templates.
 */
public class RequireMentsVO {
    public String requireNo;
    public String hqNo;
    public String name;
    public String alias;
    public String cvsPath;
    public String staffRole;
    public String roleBranch;


    public String getRoleBranch() {
        return roleBranch;
    }

    public void setRoleBranch(String roleBranch) {
        this.roleBranch = roleBranch;
    }


    public String getStaffRole() {
        return staffRole;
    }

    public void setStaffRole(String staffRole) {
        this.staffRole = staffRole;
    }

    public String getRequireNo() {
        return requireNo;
    }

    public void setRequireNo(String requireNo) {
        this.requireNo = requireNo;
    }

    public String getHqNo() {
        return hqNo;
    }

    public void setHqNo(String hqNo) {
        this.hqNo = hqNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getCvsPath() {
        return cvsPath;
    }

    public void setCvsPath(String cvsPath) {
        this.cvsPath = cvsPath;
    }
}
