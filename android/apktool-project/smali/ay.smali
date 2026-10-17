.class public final Lay;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/io/Flushable;


# static fields
.field public static final B:Lkz0;

.field public static final C:Ljava/lang/String;

.field public static final D:Ljava/lang/String;

.field public static final E:Ljava/lang/String;

.field public static final F:Ljava/lang/String;


# instance fields
.field public final A:Lzx;

.field public final j:Ljava/io/File;

.field public final k:J

.field public final l:Ljava/io/File;

.field public final m:Ljava/io/File;

.field public final n:Ljava/io/File;

.field public o:J

.field public p:Lrx0;

.field public final q:Ljava/util/LinkedHashMap;

.field public r:I

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:J

.field public final z:Lob1;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lkz0;

    .line 2
    .line 3
    const-string v1, "[a-z0-9_-]{1,120}"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lkz0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lay;->B:Lkz0;

    .line 9
    .line 10
    const-string v0, "CLEAN"

    .line 11
    .line 12
    sput-object v0, Lay;->C:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "DIRTY"

    .line 15
    .line 16
    sput-object v0, Lay;->D:Ljava/lang/String;

    .line 17
    .line 18
    const-string v0, "REMOVE"

    .line 19
    .line 20
    sput-object v0, Lay;->E:Ljava/lang/String;

    .line 21
    .line 22
    const-string v0, "READ"

    .line 23
    .line 24
    sput-object v0, Lay;->F:Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method

.method public constructor <init>(Ljava/io/File;JLqb1;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lay;->j:Ljava/io/File;

    .line 11
    .line 12
    iput-wide p2, p0, Lay;->k:J

    .line 13
    .line 14
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 15
    .line 16
    const/high16 v1, 0x3f400000    # 0.75f

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-direct {v0, v3, v1, v2}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lay;->q:Ljava/util/LinkedHashMap;

    .line 24
    .line 25
    invoke-virtual {p4}, Lqb1;->d()Lob1;

    .line 26
    .line 27
    .line 28
    move-result-object p4

    .line 29
    iput-object p4, p0, Lay;->z:Lob1;

    .line 30
    .line 31
    new-instance p4, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    sget-object v0, Ljg1;->f:Ljava/lang/String;

    .line 37
    .line 38
    const-string v1, " Cache"

    .line 39
    .line 40
    invoke-static {p4, v0, v1}, Loq;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p4

    .line 44
    new-instance v0, Lzx;

    .line 45
    .line 46
    invoke-direct {v0, p0, p4, v3}, Lzx;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lay;->A:Lzx;

    .line 50
    .line 51
    const-wide/16 v0, 0x0

    .line 52
    .line 53
    cmp-long p2, p2, v0

    .line 54
    .line 55
    if-lez p2, :cond_0

    .line 56
    .line 57
    new-instance p2, Ljava/io/File;

    .line 58
    .line 59
    const-string p3, "journal"

    .line 60
    .line 61
    invoke-direct {p2, p1, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iput-object p2, p0, Lay;->l:Ljava/io/File;

    .line 65
    .line 66
    new-instance p2, Ljava/io/File;

    .line 67
    .line 68
    const-string p3, "journal.tmp"

    .line 69
    .line 70
    invoke-direct {p2, p1, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iput-object p2, p0, Lay;->m:Ljava/io/File;

    .line 74
    .line 75
    new-instance p2, Ljava/io/File;

    .line 76
    .line 77
    const-string p3, "journal.bkp"

    .line 78
    .line 79
    invoke-direct {p2, p1, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iput-object p2, p0, Lay;->n:Ljava/io/File;

    .line 83
    .line 84
    return-void

    .line 85
    :cond_0
    const-string p0, "maxSize <= 0"

    .line 86
    .line 87
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    const/4 p0, 0x0

    .line 91
    throw p0
.end method

.method public static z(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lay;->B:Lkz0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    iget-object v0, v0, Lkz0;->j:Ljava/util/regex/Pattern;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string v0, "keys must match regex [a-z0-9_-]{1,120}: \""

    .line 23
    .line 24
    invoke-static {p0, v0}, Lo40;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public final declared-synchronized a()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lay;->v:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    const-string v0, "cache is closed"

    .line 9
    .line 10
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    throw v1

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method

.method public final declared-synchronized close()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lay;->u:Z

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-boolean v0, p0, Lay;->v:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    iget-object v0, p0, Lay;->q:Ljava/util/LinkedHashMap;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    new-array v3, v2, [Lxx;

    .line 23
    .line 24
    invoke-interface {v0, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, [Lxx;

    .line 29
    .line 30
    array-length v3, v0

    .line 31
    :goto_0
    if-ge v2, v3, :cond_2

    .line 32
    .line 33
    aget-object v4, v0, v2

    .line 34
    .line 35
    iget-object v4, v4, Lxx;->g:Lvx;

    .line 36
    .line 37
    if-eqz v4, :cond_1

    .line 38
    .line 39
    invoke-virtual {v4}, Lvx;->c()V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :catchall_0
    move-exception v0

    .line 44
    goto :goto_3

    .line 45
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    invoke-virtual {p0}, Lay;->y()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lay;->p:Lrx0;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Lrx0;->close()V

    .line 57
    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    iput-object v0, p0, Lay;->p:Lrx0;

    .line 61
    .line 62
    iput-boolean v1, p0, Lay;->v:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .line 64
    monitor-exit p0

    .line 65
    return-void

    .line 66
    :cond_3
    :goto_2
    :try_start_1
    iput-boolean v1, p0, Lay;->v:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    .line 68
    monitor-exit p0

    .line 69
    return-void

    .line 70
    :goto_3
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 71
    throw v0
.end method

.method public final declared-synchronized flush()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lay;->u:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lay;->a()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lay;->y()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lay;->p:Lrx0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Lrx0;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception v0

    .line 25
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 26
    throw v0
.end method

.method public final declared-synchronized g(Lvx;Z)V
    .locals 10

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p1, Lvx;->b:Ljava/lang/Object;

    .line 3
    .line 4
    check-cast v0, Lxx;

    .line 5
    .line 6
    iget-object v1, v0, Lxx;->g:Lvx;

    .line 7
    .line 8
    invoke-static {v1, p1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_e

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz p2, :cond_2

    .line 17
    .line 18
    iget-boolean v3, v0, Lxx;->e:Z

    .line 19
    .line 20
    if-nez v3, :cond_2

    .line 21
    .line 22
    move v3, v2

    .line 23
    :goto_0
    if-ge v3, v1, :cond_2

    .line 24
    .line 25
    iget-object v4, p1, Lvx;->c:Ljava/io/Serializable;

    .line 26
    .line 27
    check-cast v4, [Z

    .line 28
    .line 29
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    aget-boolean v4, v4, v3

    .line 33
    .line 34
    if-eqz v4, :cond_1

    .line 35
    .line 36
    iget-object v4, v0, Lxx;->d:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    check-cast v4, Ljava/io/File;

    .line 43
    .line 44
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-nez v4, :cond_0

    .line 52
    .line 53
    invoke-virtual {p1}, Lvx;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    .line 55
    .line 56
    monitor-exit p0

    .line 57
    return-void

    .line 58
    :catchall_0
    move-exception p1

    .line 59
    goto/16 :goto_6

    .line 60
    .line 61
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lvx;->a()V

    .line 65
    .line 66
    .line 67
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 68
    .line 69
    new-instance p2, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v0, "Newly created entry didn\'t create value for index "

    .line 75
    .line 76
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    throw p1

    .line 90
    :cond_2
    move p1, v2

    .line 91
    :goto_1
    if-ge p1, v1, :cond_6

    .line 92
    .line 93
    iget-object v3, v0, Lxx;->d:Ljava/util/ArrayList;

    .line 94
    .line 95
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    check-cast v3, Ljava/io/File;

    .line 100
    .line 101
    if-eqz p2, :cond_3

    .line 102
    .line 103
    iget-boolean v4, v0, Lxx;->f:Z

    .line 104
    .line 105
    if-nez v4, :cond_3

    .line 106
    .line 107
    sget-object v4, Lok0;->m:Lok0;

    .line 108
    .line 109
    invoke-virtual {v4, v3}, Lok0;->r(Ljava/io/File;)Z

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    if-eqz v5, :cond_5

    .line 114
    .line 115
    iget-object v5, v0, Lxx;->c:Ljava/util/ArrayList;

    .line 116
    .line 117
    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    check-cast v5, Ljava/io/File;

    .line 122
    .line 123
    invoke-virtual {v4, v3, v5}, Lok0;->v(Ljava/io/File;Ljava/io/File;)V

    .line 124
    .line 125
    .line 126
    iget-object v3, v0, Lxx;->b:[J

    .line 127
    .line 128
    aget-wide v6, v3, p1

    .line 129
    .line 130
    invoke-virtual {v5}, Ljava/io/File;->length()J

    .line 131
    .line 132
    .line 133
    move-result-wide v3

    .line 134
    iget-object v5, v0, Lxx;->b:[J

    .line 135
    .line 136
    aput-wide v3, v5, p1

    .line 137
    .line 138
    iget-wide v8, p0, Lay;->o:J

    .line 139
    .line 140
    sub-long/2addr v8, v6

    .line 141
    add-long/2addr v8, v3

    .line 142
    iput-wide v8, p0, Lay;->o:J

    .line 143
    .line 144
    goto :goto_2

    .line 145
    :cond_3
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 149
    .line 150
    .line 151
    move-result v4

    .line 152
    if-nez v4, :cond_5

    .line 153
    .line 154
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 155
    .line 156
    .line 157
    move-result v4

    .line 158
    if-nez v4, :cond_4

    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_4
    new-instance p1, Ljava/io/IOException;

    .line 162
    .line 163
    new-instance p2, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    const-string v0, "failed to delete "

    .line 166
    .line 167
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p2

    .line 177
    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    throw p1

    .line 181
    :cond_5
    :goto_2
    add-int/lit8 p1, p1, 0x1

    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_6
    const/4 p1, 0x0

    .line 185
    iput-object p1, v0, Lxx;->g:Lvx;

    .line 186
    .line 187
    iget-boolean p1, v0, Lxx;->f:Z

    .line 188
    .line 189
    if-eqz p1, :cond_7

    .line 190
    .line 191
    invoke-virtual {p0, v0}, Lay;->x(Lxx;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 192
    .line 193
    .line 194
    monitor-exit p0

    .line 195
    return-void

    .line 196
    :cond_7
    :try_start_2
    iget p1, p0, Lay;->r:I

    .line 197
    .line 198
    const/4 v1, 0x1

    .line 199
    add-int/2addr p1, v1

    .line 200
    iput p1, p0, Lay;->r:I

    .line 201
    .line 202
    iget-object p1, p0, Lay;->p:Lrx0;

    .line 203
    .line 204
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 205
    .line 206
    .line 207
    iget-boolean v3, v0, Lxx;->e:Z

    .line 208
    .line 209
    const/16 v4, 0xa

    .line 210
    .line 211
    const/16 v5, 0x20

    .line 212
    .line 213
    if-nez v3, :cond_9

    .line 214
    .line 215
    if-eqz p2, :cond_8

    .line 216
    .line 217
    goto :goto_3

    .line 218
    :cond_8
    iget-object p2, p0, Lay;->q:Ljava/util/LinkedHashMap;

    .line 219
    .line 220
    iget-object v1, v0, Lxx;->a:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {p2, v1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    sget-object p2, Lay;->E:Ljava/lang/String;

    .line 226
    .line 227
    invoke-virtual {p1, p2}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 228
    .line 229
    .line 230
    invoke-virtual {p1, v5}, Lrx0;->writeByte(I)Lkh;

    .line 231
    .line 232
    .line 233
    iget-object p2, v0, Lxx;->a:Ljava/lang/String;

    .line 234
    .line 235
    invoke-virtual {p1, p2}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 236
    .line 237
    .line 238
    invoke-virtual {p1, v4}, Lrx0;->writeByte(I)Lkh;

    .line 239
    .line 240
    .line 241
    goto :goto_5

    .line 242
    :cond_9
    :goto_3
    iput-boolean v1, v0, Lxx;->e:Z

    .line 243
    .line 244
    sget-object v1, Lay;->C:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {p1, v1}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 247
    .line 248
    .line 249
    invoke-virtual {p1, v5}, Lrx0;->writeByte(I)Lkh;

    .line 250
    .line 251
    .line 252
    iget-object v1, v0, Lxx;->a:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {p1, v1}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 255
    .line 256
    .line 257
    iget-object v1, v0, Lxx;->b:[J

    .line 258
    .line 259
    array-length v3, v1

    .line 260
    :goto_4
    if-ge v2, v3, :cond_a

    .line 261
    .line 262
    aget-wide v6, v1, v2

    .line 263
    .line 264
    invoke-virtual {p1, v5}, Lrx0;->writeByte(I)Lkh;

    .line 265
    .line 266
    .line 267
    invoke-virtual {p1, v6, v7}, Lrx0;->p(J)Lkh;

    .line 268
    .line 269
    .line 270
    add-int/lit8 v2, v2, 0x1

    .line 271
    .line 272
    goto :goto_4

    .line 273
    :cond_a
    invoke-virtual {p1, v4}, Lrx0;->writeByte(I)Lkh;

    .line 274
    .line 275
    .line 276
    if-eqz p2, :cond_b

    .line 277
    .line 278
    iget-wide v1, p0, Lay;->y:J

    .line 279
    .line 280
    const-wide/16 v3, 0x1

    .line 281
    .line 282
    add-long/2addr v3, v1

    .line 283
    iput-wide v3, p0, Lay;->y:J

    .line 284
    .line 285
    iput-wide v1, v0, Lxx;->i:J

    .line 286
    .line 287
    :cond_b
    :goto_5
    invoke-virtual {p1}, Lrx0;->flush()V

    .line 288
    .line 289
    .line 290
    iget-wide p1, p0, Lay;->o:J

    .line 291
    .line 292
    iget-wide v0, p0, Lay;->k:J

    .line 293
    .line 294
    cmp-long p1, p1, v0

    .line 295
    .line 296
    if-gtz p1, :cond_c

    .line 297
    .line 298
    invoke-virtual {p0}, Lay;->r()Z

    .line 299
    .line 300
    .line 301
    move-result p1

    .line 302
    if-eqz p1, :cond_d

    .line 303
    .line 304
    :cond_c
    iget-object p1, p0, Lay;->z:Lob1;

    .line 305
    .line 306
    iget-object p2, p0, Lay;->A:Lzx;

    .line 307
    .line 308
    invoke-static {p1, p2}, Lob1;->d(Lob1;Ljb1;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 309
    .line 310
    .line 311
    :cond_d
    monitor-exit p0

    .line 312
    return-void

    .line 313
    :cond_e
    :try_start_3
    const-string p1, "Check failed."

    .line 314
    .line 315
    new-instance p2, Ljava/lang/IllegalStateException;

    .line 316
    .line 317
    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    throw p2

    .line 321
    :goto_6
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 322
    throw p1
.end method

.method public final declared-synchronized h(Ljava/lang/String;J)Lvx;
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lay;->l()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lay;->a()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lay;->z(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lay;->q:Ljava/util/LinkedHashMap;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lxx;

    .line 21
    .line 22
    const-wide/16 v1, -0x1

    .line 23
    .line 24
    cmp-long v1, p2, v1

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-wide v3, v0, Lxx;->i:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    cmp-long p2, v3, p2

    .line 34
    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_3

    .line 40
    :cond_0
    :goto_0
    monitor-exit p0

    .line 41
    return-object v2

    .line 42
    :cond_1
    if-eqz v0, :cond_2

    .line 43
    .line 44
    :try_start_1
    iget-object p2, v0, Lxx;->g:Lvx;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    move-object p2, v2

    .line 48
    :goto_1
    if-eqz p2, :cond_3

    .line 49
    .line 50
    monitor-exit p0

    .line 51
    return-object v2

    .line 52
    :cond_3
    if-eqz v0, :cond_4

    .line 53
    .line 54
    :try_start_2
    iget p2, v0, Lxx;->h:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 55
    .line 56
    if-eqz p2, :cond_4

    .line 57
    .line 58
    monitor-exit p0

    .line 59
    return-object v2

    .line 60
    :cond_4
    :try_start_3
    iget-boolean p2, p0, Lay;->w:Z

    .line 61
    .line 62
    if-nez p2, :cond_8

    .line 63
    .line 64
    iget-boolean p2, p0, Lay;->x:Z

    .line 65
    .line 66
    if-eqz p2, :cond_5

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_5
    iget-object p2, p0, Lay;->p:Lrx0;

    .line 70
    .line 71
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    sget-object p3, Lay;->D:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p2, p3}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 77
    .line 78
    .line 79
    const/16 p3, 0x20

    .line 80
    .line 81
    invoke-virtual {p2, p3}, Lrx0;->writeByte(I)Lkh;

    .line 82
    .line 83
    .line 84
    invoke-interface {p2, p1}, Lkh;->o(Ljava/lang/String;)Lkh;

    .line 85
    .line 86
    .line 87
    const/16 p3, 0xa

    .line 88
    .line 89
    invoke-interface {p2, p3}, Lkh;->writeByte(I)Lkh;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p2}, Lrx0;->flush()V

    .line 93
    .line 94
    .line 95
    iget-boolean p2, p0, Lay;->s:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 96
    .line 97
    if-eqz p2, :cond_6

    .line 98
    .line 99
    monitor-exit p0

    .line 100
    return-object v2

    .line 101
    :cond_6
    if-nez v0, :cond_7

    .line 102
    .line 103
    :try_start_4
    new-instance v0, Lxx;

    .line 104
    .line 105
    invoke-direct {v0, p0, p1}, Lxx;-><init>(Lay;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    iget-object p2, p0, Lay;->q:Ljava/util/LinkedHashMap;

    .line 109
    .line 110
    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    :cond_7
    new-instance p1, Lvx;

    .line 114
    .line 115
    invoke-direct {p1, p0, v0}, Lvx;-><init>(Lay;Lxx;)V

    .line 116
    .line 117
    .line 118
    iput-object p1, v0, Lxx;->g:Lvx;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 119
    .line 120
    monitor-exit p0

    .line 121
    return-object p1

    .line 122
    :cond_8
    :goto_2
    :try_start_5
    iget-object p1, p0, Lay;->z:Lob1;

    .line 123
    .line 124
    iget-object p2, p0, Lay;->A:Lzx;

    .line 125
    .line 126
    invoke-static {p1, p2}, Lob1;->d(Lob1;Ljb1;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 127
    .line 128
    .line 129
    monitor-exit p0

    .line 130
    return-object v2

    .line 131
    :goto_3
    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 132
    throw p1
.end method

.method public final declared-synchronized j(Ljava/lang/String;)Lyx;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lay;->l()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lay;->a()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lay;->z(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lay;->q:Ljava/util/LinkedHashMap;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lxx;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return-object v1

    .line 27
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Lxx;->a()Lyx;

    .line 28
    .line 29
    .line 30
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    monitor-exit p0

    .line 34
    return-object v1

    .line 35
    :cond_1
    :try_start_2
    iget v1, p0, Lay;->r:I

    .line 36
    .line 37
    add-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    iput v1, p0, Lay;->r:I

    .line 40
    .line 41
    iget-object v1, p0, Lay;->p:Lrx0;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    sget-object v2, Lay;->F:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 49
    .line 50
    .line 51
    const/16 v2, 0x20

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Lrx0;->writeByte(I)Lkh;

    .line 54
    .line 55
    .line 56
    invoke-interface {v1, p1}, Lkh;->o(Ljava/lang/String;)Lkh;

    .line 57
    .line 58
    .line 59
    const/16 p1, 0xa

    .line 60
    .line 61
    invoke-interface {v1, p1}, Lkh;->writeByte(I)Lkh;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lay;->r()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    iget-object p1, p0, Lay;->z:Lob1;

    .line 71
    .line 72
    iget-object v1, p0, Lay;->A:Lzx;

    .line 73
    .line 74
    invoke-static {p1, v1}, Lob1;->d(Lob1;Ljb1;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :catchall_0
    move-exception p1

    .line 79
    goto :goto_1

    .line 80
    :cond_2
    :goto_0
    monitor-exit p0

    .line 81
    return-object v0

    .line 82
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 83
    throw p1
.end method

.method public final declared-synchronized l()V
    .locals 6

    .line 1
    const-string v0, "DiskLruCache "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    sget-object v1, Ljg1;->a:[B

    .line 5
    .line 6
    iget-boolean v1, p0, Lay;->u:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :cond_0
    :try_start_1
    sget-object v1, Lok0;->m:Lok0;

    .line 13
    .line 14
    iget-object v2, p0, Lay;->n:Ljava/io/File;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Lok0;->r(Ljava/io/File;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_2

    .line 21
    .line 22
    iget-object v2, p0, Lay;->l:Ljava/io/File;

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Lok0;->r(Ljava/io/File;)Z

    .line 25
    .line 26
    .line 27
    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    iget-object v3, p0, Lay;->n:Ljava/io/File;

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    :try_start_2
    invoke-virtual {v1, v3}, Lok0;->p(Ljava/io/File;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto/16 :goto_3

    .line 38
    .line 39
    :cond_1
    iget-object v2, p0, Lay;->l:Ljava/io/File;

    .line 40
    .line 41
    invoke-virtual {v1, v3, v2}, Lok0;->v(Ljava/io/File;Ljava/io/File;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    :goto_0
    iget-object v2, p0, Lay;->n:Ljava/io/File;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2}, Lok0;->w(Ljava/io/File;)Lma;

    .line 50
    .line 51
    .line 52
    move-result-object v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 53
    const/4 v4, 0x0

    .line 54
    const/4 v5, 0x1

    .line 55
    :try_start_3
    invoke-virtual {v1, v2}, Lok0;->p(Ljava/io/File;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 56
    .line 57
    .line 58
    :try_start_4
    invoke-virtual {v3}, Lma;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 59
    .line 60
    .line 61
    move v1, v5

    .line 62
    goto :goto_1

    .line 63
    :catchall_1
    move-exception v0

    .line 64
    :try_start_5
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 65
    :catchall_2
    move-exception v1

    .line 66
    :try_start_6
    invoke-static {v3, v0}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 67
    .line 68
    .line 69
    throw v1

    .line 70
    :catch_0
    invoke-virtual {v3}, Lma;->close()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, v2}, Lok0;->p(Ljava/io/File;)V

    .line 74
    .line 75
    .line 76
    move v1, v4

    .line 77
    :goto_1
    iput-boolean v1, p0, Lay;->t:Z

    .line 78
    .line 79
    iget-object v1, p0, Lay;->l:Ljava/io/File;

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 85
    .line 86
    .line 87
    move-result v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 88
    if-eqz v1, :cond_3

    .line 89
    .line 90
    :try_start_7
    invoke-virtual {p0}, Lay;->u()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Lay;->t()V

    .line 94
    .line 95
    .line 96
    iput-boolean v5, p0, Lay;->u:Z
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 97
    .line 98
    monitor-exit p0

    .line 99
    return-void

    .line 100
    :catch_1
    move-exception v1

    .line 101
    :try_start_8
    sget-object v2, Lgt0;->a:Lgt0;

    .line 102
    .line 103
    sget-object v2, Lgt0;->a:Lgt0;

    .line 104
    .line 105
    new-instance v3, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lay;->j:Ljava/io/File;

    .line 111
    .line 112
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v0, " is corrupt: "

    .line 116
    .line 117
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v0, ", removing"

    .line 128
    .line 129
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 137
    .line 138
    .line 139
    const/4 v2, 0x5

    .line 140
    invoke-static {v2, v0, v1}, Lgt0;->i(ILjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 141
    .line 142
    .line 143
    :try_start_9
    invoke-virtual {p0}, Lay;->close()V

    .line 144
    .line 145
    .line 146
    sget-object v0, Lok0;->m:Lok0;

    .line 147
    .line 148
    iget-object v1, p0, Lay;->j:Ljava/io/File;

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Lok0;->q(Ljava/io/File;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 151
    .line 152
    .line 153
    :try_start_a
    iput-boolean v4, p0, Lay;->v:Z

    .line 154
    .line 155
    goto :goto_2

    .line 156
    :catchall_3
    move-exception v0

    .line 157
    iput-boolean v4, p0, Lay;->v:Z

    .line 158
    .line 159
    throw v0

    .line 160
    :cond_3
    :goto_2
    invoke-virtual {p0}, Lay;->w()V

    .line 161
    .line 162
    .line 163
    iput-boolean v5, p0, Lay;->u:Z
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 164
    .line 165
    monitor-exit p0

    .line 166
    return-void

    .line 167
    :goto_3
    :try_start_b
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 168
    throw v0
.end method

.method public final r()Z
    .locals 2

    .line 1
    iget v0, p0, Lay;->r:I

    .line 2
    .line 3
    const/16 v1, 0x7d0

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lay;->q:Ljava/util/LinkedHashMap;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/util/AbstractMap;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-lt v0, p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final s()Lrx0;
    .locals 5

    .line 1
    iget-object v0, p0, Lay;->l:Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    :try_start_0
    sget-object v2, Lnr0;->a:Ljava/util/logging/Logger;

    .line 8
    .line 9
    new-instance v2, Ljava/io/FileOutputStream;

    .line 10
    .line 11
    invoke-direct {v2, v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 12
    .line 13
    .line 14
    new-instance v3, Lma;

    .line 15
    .line 16
    new-instance v4, Lnc1;

    .line 17
    .line 18
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-direct {v3, v2, v1, v4}, Lma;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 30
    .line 31
    .line 32
    sget-object v2, Lnr0;->a:Ljava/util/logging/Logger;

    .line 33
    .line 34
    new-instance v2, Ljava/io/FileOutputStream;

    .line 35
    .line 36
    invoke-direct {v2, v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 37
    .line 38
    .line 39
    new-instance v3, Lma;

    .line 40
    .line 41
    new-instance v0, Lnc1;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-direct {v3, v2, v1, v0}, Lma;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    new-instance v0, Lt20;

    .line 50
    .line 51
    new-instance v2, Ltu;

    .line 52
    .line 53
    invoke-direct {v2, v1, p0}, Ltu;-><init>(ILjava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    invoke-direct {v0, v3, v2}, Lt20;-><init>(Lma;Lr80;)V

    .line 57
    .line 58
    .line 59
    new-instance p0, Lrx0;

    .line 60
    .line 61
    invoke-direct {p0, v0}, Lrx0;-><init>(La81;)V

    .line 62
    .line 63
    .line 64
    return-object p0
.end method

.method public final t()V
    .locals 10

    .line 1
    sget-object v0, Lok0;->m:Lok0;

    .line 2
    .line 3
    iget-object v1, p0, Lay;->m:Ljava/io/File;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lok0;->p(Ljava/io/File;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lay;->q:Ljava/util/LinkedHashMap;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_3

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    check-cast v2, Lxx;

    .line 32
    .line 33
    iget-object v3, v2, Lxx;->g:Lvx;

    .line 34
    .line 35
    const/4 v4, 0x2

    .line 36
    const/4 v5, 0x0

    .line 37
    if-nez v3, :cond_1

    .line 38
    .line 39
    :goto_1
    if-ge v5, v4, :cond_0

    .line 40
    .line 41
    iget-wide v6, p0, Lay;->o:J

    .line 42
    .line 43
    iget-object v3, v2, Lxx;->b:[J

    .line 44
    .line 45
    aget-wide v8, v3, v5

    .line 46
    .line 47
    add-long/2addr v6, v8

    .line 48
    iput-wide v6, p0, Lay;->o:J

    .line 49
    .line 50
    add-int/lit8 v5, v5, 0x1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    const/4 v3, 0x0

    .line 54
    iput-object v3, v2, Lxx;->g:Lvx;

    .line 55
    .line 56
    :goto_2
    if-ge v5, v4, :cond_2

    .line 57
    .line 58
    iget-object v3, v2, Lxx;->c:Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    check-cast v3, Ljava/io/File;

    .line 65
    .line 66
    invoke-virtual {v0, v3}, Lok0;->p(Ljava/io/File;)V

    .line 67
    .line 68
    .line 69
    iget-object v3, v2, Lxx;->d:Ljava/util/ArrayList;

    .line 70
    .line 71
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    check-cast v3, Ljava/io/File;

    .line 76
    .line 77
    invoke-virtual {v0, v3}, Lok0;->p(Ljava/io/File;)V

    .line 78
    .line 79
    .line 80
    add-int/lit8 v5, v5, 0x1

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    return-void
.end method

.method public final u()V
    .locals 11

    .line 1
    const-string v0, ", "

    .line 2
    .line 3
    const-string v1, "unexpected journal header: ["

    .line 4
    .line 5
    iget-object v2, p0, Lay;->l:Ljava/io/File;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    sget-object v3, Lnr0;->a:Ljava/util/logging/Logger;

    .line 11
    .line 12
    new-instance v3, Lna;

    .line 13
    .line 14
    new-instance v4, Ljava/io/FileInputStream;

    .line 15
    .line 16
    invoke-direct {v4, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 17
    .line 18
    .line 19
    sget-object v2, Lnc1;->d:Lmc1;

    .line 20
    .line 21
    invoke-direct {v3, v4, v2}, Lna;-><init>(Ljava/io/InputStream;Lnc1;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Lsx0;

    .line 25
    .line 26
    invoke-direct {v2, v3}, Lsx0;-><init>(Lp81;)V

    .line 27
    .line 28
    .line 29
    const-wide v3, 0x7fffffffffffffffL

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    :try_start_0
    invoke-virtual {v2, v3, v4}, Lsx0;->k(J)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-virtual {v2, v3, v4}, Lsx0;->k(J)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    invoke-virtual {v2, v3, v4}, Lsx0;->k(J)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v7

    .line 46
    invoke-virtual {v2, v3, v4}, Lsx0;->k(J)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v8

    .line 50
    invoke-virtual {v2, v3, v4}, Lsx0;->k(J)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v9

    .line 54
    const-string v10, "libcore.io.DiskLruCache"

    .line 55
    .line 56
    invoke-virtual {v10, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v10

    .line 60
    if-eqz v10, :cond_1

    .line 61
    .line 62
    const-string v10, "1"

    .line 63
    .line 64
    invoke-virtual {v10, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v10

    .line 68
    if-eqz v10, :cond_1

    .line 69
    .line 70
    const v10, 0x31191

    .line 71
    .line 72
    .line 73
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v10

    .line 77
    invoke-static {v10, v7}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v7

    .line 81
    if-eqz v7, :cond_1

    .line 82
    .line 83
    const/4 v7, 0x2

    .line 84
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v7

    .line 88
    invoke-static {v7, v8}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    if-eqz v7, :cond_1

    .line 93
    .line 94
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 95
    .line 96
    .line 97
    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    if-gtz v7, :cond_1

    .line 99
    .line 100
    const/4 v0, 0x0

    .line 101
    :goto_0
    :try_start_1
    invoke-virtual {v2, v3, v4}, Lsx0;->k(J)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {p0, v1}, Lay;->v(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 106
    .line 107
    .line 108
    add-int/lit8 v0, v0, 0x1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :catchall_0
    move-exception p0

    .line 112
    goto :goto_2

    .line 113
    :catch_0
    :try_start_2
    iget-object v1, p0, Lay;->q:Ljava/util/LinkedHashMap;

    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/util/AbstractMap;->size()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    sub-int/2addr v0, v1

    .line 120
    iput v0, p0, Lay;->r:I

    .line 121
    .line 122
    invoke-virtual {v2}, Lsx0;->a()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_0

    .line 127
    .line 128
    invoke-virtual {p0}, Lay;->w()V

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_0
    invoke-virtual {p0}, Lay;->s()Lrx0;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Lay;->p:Lrx0;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 137
    .line 138
    :goto_1
    invoke-virtual {v2}, Lsx0;->close()V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_1
    :try_start_3
    new-instance p0, Ljava/io/IOException;

    .line 143
    .line 144
    new-instance v3, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    const/16 v0, 0x5d

    .line 171
    .line 172
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 183
    :goto_2
    :try_start_4
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 184
    :catchall_1
    move-exception v0

    .line 185
    invoke-static {v2, p0}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 186
    .line 187
    .line 188
    throw v0
.end method

.method public final v(Ljava/lang/String;)V
    .locals 10

    .line 1
    const/4 v0, 0x6

    .line 2
    const/16 v1, 0x20

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-static {p1, v1, v2, v0}, Lda1;->C(Ljava/lang/CharSequence;CII)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v3, "unexpected journal line: "

    .line 10
    .line 11
    const/4 v4, -0x1

    .line 12
    if-eq v0, v4, :cond_8

    .line 13
    .line 14
    add-int/lit8 v5, v0, 0x1

    .line 15
    .line 16
    const/4 v6, 0x4

    .line 17
    invoke-static {p1, v1, v5, v6}, Lda1;->C(Ljava/lang/CharSequence;CII)I

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    iget-object v7, p0, Lay;->q:Ljava/util/LinkedHashMap;

    .line 22
    .line 23
    if-ne v6, v4, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    sget-object v8, Lay;->E:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 32
    .line 33
    .line 34
    move-result v9

    .line 35
    if-ne v0, v9, :cond_1

    .line 36
    .line 37
    invoke-static {p1, v8, v2}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 38
    .line 39
    .line 40
    move-result v8

    .line 41
    if-eqz v8, :cond_1

    .line 42
    .line 43
    invoke-virtual {v7, v5}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-virtual {p1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    :cond_1
    invoke-virtual {v7, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v8

    .line 55
    check-cast v8, Lxx;

    .line 56
    .line 57
    if-nez v8, :cond_2

    .line 58
    .line 59
    new-instance v8, Lxx;

    .line 60
    .line 61
    invoke-direct {v8, p0, v5}, Lxx;-><init>(Lay;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-interface {v7, v5, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    :cond_2
    if-eq v6, v4, :cond_4

    .line 68
    .line 69
    sget-object v5, Lay;->C:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 72
    .line 73
    .line 74
    move-result v7

    .line 75
    if-ne v0, v7, :cond_4

    .line 76
    .line 77
    invoke-static {p1, v5, v2}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    if-eqz v5, :cond_4

    .line 82
    .line 83
    const/4 p0, 0x1

    .line 84
    add-int/2addr v6, p0

    .line 85
    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    new-array v0, p0, [C

    .line 90
    .line 91
    aput-char v1, v0, v2

    .line 92
    .line 93
    invoke-static {p1, v0}, Lda1;->N(Ljava/lang/String;[C)Ljava/util/List;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-boolean p0, v8, Lxx;->e:Z

    .line 98
    .line 99
    const/4 p0, 0x0

    .line 100
    iput-object p0, v8, Lxx;->g:Lvx;

    .line 101
    .line 102
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    iget-object v0, v8, Lxx;->j:Lay;

    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 109
    .line 110
    .line 111
    const/4 v0, 0x2

    .line 112
    if-ne p0, v0, :cond_3

    .line 113
    .line 114
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    :goto_0
    if-ge v2, p0, :cond_6

    .line 119
    .line 120
    iget-object v0, v8, Lxx;->b:[J

    .line 121
    .line 122
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    check-cast v1, Ljava/lang/String;

    .line 127
    .line 128
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 129
    .line 130
    .line 131
    move-result-wide v4

    .line 132
    aput-wide v4, v0, v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    .line 134
    add-int/lit8 v2, v2, 0x1

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :catch_0
    invoke-static {p1, v3}, Lz0;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_3
    invoke-static {p1, v3}, Lz0;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_4
    if-ne v6, v4, :cond_5

    .line 146
    .line 147
    sget-object v1, Lay;->D:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    if-ne v0, v5, :cond_5

    .line 154
    .line 155
    invoke-static {p1, v1, v2}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_5

    .line 160
    .line 161
    new-instance p1, Lvx;

    .line 162
    .line 163
    invoke-direct {p1, p0, v8}, Lvx;-><init>(Lay;Lxx;)V

    .line 164
    .line 165
    .line 166
    iput-object p1, v8, Lxx;->g:Lvx;

    .line 167
    .line 168
    return-void

    .line 169
    :cond_5
    if-ne v6, v4, :cond_7

    .line 170
    .line 171
    sget-object p0, Lay;->F:Ljava/lang/String;

    .line 172
    .line 173
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    if-ne v0, v1, :cond_7

    .line 178
    .line 179
    invoke-static {p1, p0, v2}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    if-eqz p0, :cond_7

    .line 184
    .line 185
    :cond_6
    return-void

    .line 186
    :cond_7
    invoke-virtual {v3, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_8
    invoke-virtual {v3, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    return-void
.end method

.method public final declared-synchronized w()V
    .locals 10

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lay;->p:Lrx0;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lrx0;->close()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto/16 :goto_5

    .line 12
    .line 13
    :cond_0
    :goto_0
    iget-object v0, p0, Lay;->m:Ljava/io/File;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    const/4 v2, 0x0

    .line 20
    :try_start_1
    sget-object v3, Lnr0;->a:Ljava/util/logging/Logger;

    .line 21
    .line 22
    new-instance v3, Ljava/io/FileOutputStream;

    .line 23
    .line 24
    invoke-direct {v3, v0, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 25
    .line 26
    .line 27
    new-instance v4, Lma;

    .line 28
    .line 29
    new-instance v5, Lnc1;

    .line 30
    .line 31
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-direct {v4, v3, v1, v5}, Lma;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :catch_0
    :try_start_2
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 43
    .line 44
    .line 45
    sget-object v3, Lnr0;->a:Ljava/util/logging/Logger;

    .line 46
    .line 47
    new-instance v3, Ljava/io/FileOutputStream;

    .line 48
    .line 49
    invoke-direct {v3, v0, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 50
    .line 51
    .line 52
    new-instance v4, Lma;

    .line 53
    .line 54
    new-instance v0, Lnc1;

    .line 55
    .line 56
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-direct {v4, v3, v1, v0}, Lma;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    :goto_1
    new-instance v0, Lrx0;

    .line 63
    .line 64
    invoke-direct {v0, v4}, Lrx0;-><init>(La81;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 65
    .line 66
    .line 67
    :try_start_3
    const-string v1, "libcore.io.DiskLruCache"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 70
    .line 71
    .line 72
    const/16 v1, 0xa

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lrx0;->writeByte(I)Lkh;

    .line 75
    .line 76
    .line 77
    const-string v3, "1"

    .line 78
    .line 79
    invoke-virtual {v0, v3}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lrx0;->writeByte(I)Lkh;

    .line 83
    .line 84
    .line 85
    const-wide/32 v3, 0x31191

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v3, v4}, Lrx0;->p(J)Lkh;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lrx0;->writeByte(I)Lkh;

    .line 92
    .line 93
    .line 94
    const-wide/16 v3, 0x2

    .line 95
    .line 96
    invoke-virtual {v0, v3, v4}, Lrx0;->p(J)Lkh;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v1}, Lrx0;->writeByte(I)Lkh;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v1}, Lrx0;->writeByte(I)Lkh;

    .line 103
    .line 104
    .line 105
    iget-object v3, p0, Lay;->q:Ljava/util/LinkedHashMap;

    .line 106
    .line 107
    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    if-eqz v4, :cond_3

    .line 120
    .line 121
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    check-cast v4, Lxx;

    .line 126
    .line 127
    iget-object v5, v4, Lxx;->g:Lvx;

    .line 128
    .line 129
    const/16 v6, 0x20

    .line 130
    .line 131
    if-eqz v5, :cond_1

    .line 132
    .line 133
    sget-object v5, Lay;->D:Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {v0, v5}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v6}, Lrx0;->writeByte(I)Lkh;

    .line 139
    .line 140
    .line 141
    iget-object v4, v4, Lxx;->a:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v0, v4}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v1}, Lrx0;->writeByte(I)Lkh;

    .line 147
    .line 148
    .line 149
    goto :goto_2

    .line 150
    :catchall_1
    move-exception v1

    .line 151
    goto :goto_4

    .line 152
    :cond_1
    sget-object v5, Lay;->C:Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {v0, v5}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, v6}, Lrx0;->writeByte(I)Lkh;

    .line 158
    .line 159
    .line 160
    iget-object v5, v4, Lxx;->a:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v0, v5}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 163
    .line 164
    .line 165
    iget-object v4, v4, Lxx;->b:[J

    .line 166
    .line 167
    array-length v5, v4

    .line 168
    move v7, v2

    .line 169
    :goto_3
    if-ge v7, v5, :cond_2

    .line 170
    .line 171
    aget-wide v8, v4, v7

    .line 172
    .line 173
    invoke-virtual {v0, v6}, Lrx0;->writeByte(I)Lkh;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0, v8, v9}, Lrx0;->p(J)Lkh;

    .line 177
    .line 178
    .line 179
    add-int/lit8 v7, v7, 0x1

    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_2
    invoke-virtual {v0, v1}, Lrx0;->writeByte(I)Lkh;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 183
    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_3
    :try_start_4
    invoke-virtual {v0}, Lrx0;->close()V

    .line 187
    .line 188
    .line 189
    sget-object v0, Lok0;->m:Lok0;

    .line 190
    .line 191
    iget-object v1, p0, Lay;->l:Ljava/io/File;

    .line 192
    .line 193
    invoke-virtual {v0, v1}, Lok0;->r(Ljava/io/File;)Z

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    if-eqz v1, :cond_4

    .line 198
    .line 199
    iget-object v1, p0, Lay;->l:Ljava/io/File;

    .line 200
    .line 201
    iget-object v3, p0, Lay;->n:Ljava/io/File;

    .line 202
    .line 203
    invoke-virtual {v0, v1, v3}, Lok0;->v(Ljava/io/File;Ljava/io/File;)V

    .line 204
    .line 205
    .line 206
    :cond_4
    iget-object v1, p0, Lay;->m:Ljava/io/File;

    .line 207
    .line 208
    iget-object v3, p0, Lay;->l:Ljava/io/File;

    .line 209
    .line 210
    invoke-virtual {v0, v1, v3}, Lok0;->v(Ljava/io/File;Ljava/io/File;)V

    .line 211
    .line 212
    .line 213
    iget-object v1, p0, Lay;->n:Ljava/io/File;

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Lok0;->p(Ljava/io/File;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0}, Lay;->s()Lrx0;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    iput-object v0, p0, Lay;->p:Lrx0;

    .line 223
    .line 224
    iput-boolean v2, p0, Lay;->s:Z

    .line 225
    .line 226
    iput-boolean v2, p0, Lay;->x:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 227
    .line 228
    monitor-exit p0

    .line 229
    return-void

    .line 230
    :goto_4
    :try_start_5
    throw v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 231
    :catchall_2
    move-exception v2

    .line 232
    :try_start_6
    invoke-static {v0, v1}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 233
    .line 234
    .line 235
    throw v2

    .line 236
    :goto_5
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 237
    throw v0
.end method

.method public final x(Lxx;)V
    .locals 10

    .line 1
    iget-object v0, p1, Lxx;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-boolean v1, p0, Lay;->t:Z

    .line 4
    .line 5
    const/16 v2, 0xa

    .line 6
    .line 7
    const/16 v3, 0x20

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    if-nez v1, :cond_2

    .line 11
    .line 12
    iget v1, p1, Lxx;->h:I

    .line 13
    .line 14
    if-lez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lay;->p:Lrx0;

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    sget-object v5, Lay;->D:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1, v5}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v3}, Lrx0;->writeByte(I)Lkh;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v2}, Lrx0;->writeByte(I)Lkh;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Lrx0;->flush()V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget v1, p1, Lxx;->h:I

    .line 38
    .line 39
    if-gtz v1, :cond_1

    .line 40
    .line 41
    iget-object v1, p1, Lxx;->g:Lvx;

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    :cond_1
    iput-boolean v4, p1, Lxx;->f:Z

    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    iget-object v1, p1, Lxx;->g:Lvx;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    invoke-virtual {v1}, Lvx;->c()V

    .line 53
    .line 54
    .line 55
    :cond_3
    const/4 v1, 0x0

    .line 56
    :goto_0
    const/4 v5, 0x2

    .line 57
    if-ge v1, v5, :cond_6

    .line 58
    .line 59
    iget-object v5, p1, Lxx;->c:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    check-cast v5, Ljava/io/File;

    .line 66
    .line 67
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 71
    .line 72
    .line 73
    move-result v6

    .line 74
    if-nez v6, :cond_5

    .line 75
    .line 76
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    if-nez v6, :cond_4

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_4
    const-string p0, "failed to delete "

    .line 84
    .line 85
    invoke-static {v5, p0}, Lz0;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_5
    :goto_1
    iget-wide v5, p0, Lay;->o:J

    .line 90
    .line 91
    iget-object v7, p1, Lxx;->b:[J

    .line 92
    .line 93
    aget-wide v8, v7, v1

    .line 94
    .line 95
    sub-long/2addr v5, v8

    .line 96
    iput-wide v5, p0, Lay;->o:J

    .line 97
    .line 98
    const-wide/16 v5, 0x0

    .line 99
    .line 100
    aput-wide v5, v7, v1

    .line 101
    .line 102
    add-int/lit8 v1, v1, 0x1

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_6
    iget p1, p0, Lay;->r:I

    .line 106
    .line 107
    add-int/2addr p1, v4

    .line 108
    iput p1, p0, Lay;->r:I

    .line 109
    .line 110
    iget-object p1, p0, Lay;->p:Lrx0;

    .line 111
    .line 112
    if-eqz p1, :cond_7

    .line 113
    .line 114
    sget-object v1, Lay;->E:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {p1, v1}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, v3}, Lrx0;->writeByte(I)Lkh;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, v0}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, v2}, Lrx0;->writeByte(I)Lkh;

    .line 126
    .line 127
    .line 128
    :cond_7
    iget-object p1, p0, Lay;->q:Ljava/util/LinkedHashMap;

    .line 129
    .line 130
    invoke-virtual {p1, v0}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0}, Lay;->r()Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-eqz p1, :cond_8

    .line 138
    .line 139
    iget-object p1, p0, Lay;->z:Lob1;

    .line 140
    .line 141
    iget-object p0, p0, Lay;->A:Lzx;

    .line 142
    .line 143
    invoke-static {p1, p0}, Lob1;->d(Lob1;Ljb1;)V

    .line 144
    .line 145
    .line 146
    :cond_8
    return-void
.end method

.method public final y()V
    .locals 4

    .line 1
    :goto_0
    iget-wide v0, p0, Lay;->o:J

    .line 2
    .line 3
    iget-wide v2, p0, Lay;->k:J

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-lez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lay;->q:Ljava/util/LinkedHashMap;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lxx;

    .line 30
    .line 31
    iget-boolean v2, v1, Lxx;->f:Z

    .line 32
    .line 33
    if-nez v2, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Lay;->x(Lxx;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    return-void

    .line 40
    :cond_2
    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Lay;->w:Z

    .line 42
    .line 43
    return-void
.end method
