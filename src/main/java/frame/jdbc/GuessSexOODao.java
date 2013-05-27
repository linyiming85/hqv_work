package frame.jdbc;

import frame.VO.GuessSexVO;
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
 * Date: 13-5-20
 * Time: 下午5:41
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class GuessSexOODao {
    @Autowired
    private DataSource dataSource;

    private static GuessSexQuery guessSexQuery;

    @PostConstruct
    public void  init(){

        this.guessSexQuery=new GuessSexQuery(this.dataSource);
        //System.out.println("111111111"+guessSexQuery.execute("linym"));
    }

    public GuessSexVO getGuessSex(String userName){
        //guessSexQuery=new GuessSexQuery(this.dataSource);
        //System.out.println("guessSexQuery"+guessSexQuery);
        List list=guessSexQuery.execute(userName);
        GuessSexVO vo= (GuessSexVO) list.get(0);
        //System.out.println("Sex======"+vo.getSex());
        return guessSexQuery.findObject(userName);
    }

    private class GuessSexQuery extends MappingSqlQuery<GuessSexVO>{
        public  GuessSexQuery(DataSource ds){
            super(ds,"select user_name ,sex from guess_sex where user_name = ?");
            declareParameter(new SqlParameter(Types.VARCHAR));
            //System.out.println(ds.toString());
            compile();
        }
        public GuessSexVO mapRow(ResultSet rs,int rownum) throws SQLException{
            GuessSexVO gs=new GuessSexVO();
            gs.setSex(rs.getString("sex"));
            gs.setUserName(rs.getString("user_name"));
            //System.out.println("mapRow");
            return gs;
        }
    }
}
