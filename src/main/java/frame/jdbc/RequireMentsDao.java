package frame.jdbc;

import frame.VO.RequireMentsVO;
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
 * Time: ����2:16
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class RequireMentsDao {

    @Autowired
    public DataSource dataSource;
    public static RequireMentsQuery requireMentsQuery;

    @PostConstruct
    public void init(){
        this.requireMentsQuery=new RequireMentsQuery(dataSource);
    }

    public RequireMentsVO getRequireMents(int requireNo){
        RequireMentsVO requireMentsVO=requireMentsQuery.findObject(requireNo);
        return requireMentsVO;
    }

    private class RequireMentsQuery extends MappingSqlQuery<RequireMentsVO>{
        public RequireMentsQuery(DataSource ds){
            super(ds,"select require_no,hq_no,name,alias,cvs_path from hqv_requirements where require_no = ?");
            declareParameter(new SqlParameter(Types.INTEGER));
            compile();
        }

        public RequireMentsVO mapRow(ResultSet rs,int rownum) throws SQLException{
            RequireMentsVO rm=new RequireMentsVO();
            rm.setAlias(rs.getString("alias"));
            rm.setCvsPath(rs.getString("cvs_path"));
            rm.setHqNo(rs.getString("hq_no"));
            rm.setName(rs.getString("name"));
            rm.setRequireNo(rs.getString("require_no"));
            return rm;
        }
    }
}
