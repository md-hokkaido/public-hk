-- ユーザーテーブル
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL DEFAULT 'user', -- 'admin' または 'user'
    can_upload INTEGER NOT NULL DEFAULT 0 -- 0:不可, 1:可能
);

-- 初期管理者作成 (初期パスワード: admin123 ※本番では変更してください)
INSERT OR IGNORE INTO users (id, username, password, role, can_upload) 
VALUES (1, 'admin', 'admin123', 'admin', 1);

-- ファイル/フォルダ管理テーブル
CREATE TABLE IF NOT EXISTS files (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    is_folder INTEGER NOT NULL DEFAULT 0, -- 0:ファイル, 1:フォルダ
    parent_id INTEGER DEFAULT 0,
    r2_key TEXT, -- R2上の保存パス
    uploader TEXT NOT NULL,
    access_type TEXT NOT NULL DEFAULT 'public', -- 'public', 'admin_only', 'private'
    expire_date TEXT, -- 10日後の日時 または 'permanent'
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- お知らせテーブル
CREATE TABLE IF NOT EXISTS notices (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    author TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
