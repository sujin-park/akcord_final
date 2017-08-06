회원 검색

select id, major_name from users u, major m
where u.major_id = m.major_id and type = 1

회원 초대

insert into grouproom_list (group_id, user_id, is_accept)
values (?,?,0)


승인



승인 취소


대기 리스트

select g.group_id, u.name, u.id, m.major_name, gl.reg_date
        from grouproom_list gl, grouproom g, users u, major m
        where gl.group_id = g.group_id
        and u.user_id = gl.user_id
        and m.major_id = u.major_id
        and g.group_id = 2
        and gl.user_id <> 1


일정과 관련된 글 보기
select my.subject, my.content, my.update_date
from grouproom_hw gh, myroom_next my
where gh.myroom_next_id = my.myroom_next_id
and schedule_id = ?

select u.id, u.name, mnext.subject, mnext.content, mnext.reg_date, mnext.myroom_next_id
from grouproom g, grouproom_list gl, grouproom_hw ghw, myroom_next mnext, users u
	where gl.group_id = g.group_id
	and u.user_id = gl.user_id
	and ghw.group_id = g.group_id
	and mnext.myroom_next_id = ghw.myroom_next_id
그룹방 리스트
select g.reg_date, m.major_name, g.group_name,
g.content, u.name from users u, grouproom g, major m
where u.user_id = g.leader_id and
g.major_id = m.major_id;


요청 리스트
select gl.reg_date, m.major_name, g.group_name, g.content, g.leader_id
from grouproom_list gl, grouproom g, major m
where g.major_id = m.major_id
and gl.group_id = g.group_id
and gl.user_id = 1
and g.leader_id <> 1