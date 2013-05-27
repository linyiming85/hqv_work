package frame.jdbc;

import frame.VO.GuessSexVO;
import frame.VO.RequireStaff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.MappingSqlQuery;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: linyiming
 * Date: 13-5-21
 * Time: ����11:04
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class RequireStaffDao {
    @Autowired
    public DataSource dataSource;
    private static RequireStaffQuery requireStaffQuery;

    @PostConstruct
    public void init(){
        this.requireStaffQuery=new RequireStaffQuery(dataSource);
    }

    public List<RequireStaff> getRequireStaff(String staff_id){
        List list= requireStaffQuery.execute(staff_id);
        return list;
    }
    public class   RequireStaffQuery extends MappingSqlQuery<RequireStaff>{

        public RequireStaffQuery(DataSource ds) {
            super(ds,"select staff_role,staff_id,require_no,province_branch from hqv_require_staff where staff_id = ?");
            declareParameter(new SqlParameter(Types.VARCHAR));
            compile();
        }

        public RequireStaff mapRow(ResultSet rs,int i)throws SQLException{
            RequireStaff res=new RequireStaff();
            res.setStaffRole(rs.getString("staff_role"));
            res.setStaffId(rs.getString("staff_id"));
            res.setRequireNo(rs.getInt("require_no"));
            res.setProvinceBranch(rs.getString("province_branch"));
            return res;
        }
    }
}
