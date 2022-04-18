SELECT r.session_id,
r.blocking_session_id,
DB_NAME(r.database_id) AS Database_Name,
s.host_name,
s.login_name,
s.original_login_name,
r.status,
r.command,
r.cpu_time,
r.total_elapsed_time,
t.text as Query_Text
FROM sys.dm_exec_requests r
CROSS APPLY sys.dm_exec_sql_text(sql_handle) t
INNER JOIN sys.dm_exec_sessions s ON r.session_id = s.session_id;