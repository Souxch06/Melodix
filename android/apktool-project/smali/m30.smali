.class public final Lm30;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljw0;


# instance fields
.field public final j:Ljava/lang/Object;

.field public final k:Ljava/lang/Object;

.field public final l:Ljava/lang/Object;

.field public final m:Ljava/lang/Object;

.field public final n:Ljava/lang/Object;

.field public final o:Ljava/lang/Object;

.field public final p:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lt11;->o:Lt11;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lt11;->m(Landroid/content/Context;)Ljs;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lxd;

    .line 11
    .line 12
    iget-object v0, v0, Lxd;->a:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lm30;->j:Ljava/lang/Object;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lm30;->k:Ljava/lang/Object;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    new-instance v1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v2, ".crashlytics.v3"

    .line 31
    .line 32
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    const/16 v3, 0x28

    .line 45
    .line 46
    if-le v2, v3, :cond_0

    .line 47
    .line 48
    invoke-static {v0}, Lml;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    const-string v2, "[^a-zA-Z0-9.]"

    .line 54
    .line 55
    const-string v3, "_"

    .line 56
    .line 57
    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    goto :goto_1

    .line 69
    :cond_1
    const-string v0, ".com.google.firebase.crashlytics.files.v1"

    .line 70
    .line 71
    :goto_1
    new-instance v1, Ljava/io/File;

    .line 72
    .line 73
    invoke-direct {v1, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1}, Lm30;->c(Ljava/io/File;)V

    .line 77
    .line 78
    .line 79
    iput-object v1, p0, Lm30;->l:Ljava/lang/Object;

    .line 80
    .line 81
    new-instance p1, Ljava/io/File;

    .line 82
    .line 83
    const-string v0, "open-sessions"

    .line 84
    .line 85
    invoke-direct {p1, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-static {p1}, Lm30;->c(Ljava/io/File;)V

    .line 89
    .line 90
    .line 91
    iput-object p1, p0, Lm30;->m:Ljava/lang/Object;

    .line 92
    .line 93
    new-instance p1, Ljava/io/File;

    .line 94
    .line 95
    const-string v0, "reports"

    .line 96
    .line 97
    invoke-direct {p1, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-static {p1}, Lm30;->c(Ljava/io/File;)V

    .line 101
    .line 102
    .line 103
    iput-object p1, p0, Lm30;->n:Ljava/lang/Object;

    .line 104
    .line 105
    new-instance p1, Ljava/io/File;

    .line 106
    .line 107
    const-string v0, "priority-reports"

    .line 108
    .line 109
    invoke-direct {p1, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-static {p1}, Lm30;->c(Ljava/io/File;)V

    .line 113
    .line 114
    .line 115
    iput-object p1, p0, Lm30;->o:Ljava/lang/Object;

    .line 116
    .line 117
    new-instance p1, Ljava/io/File;

    .line 118
    .line 119
    const-string v0, "native-reports"

    .line 120
    .line 121
    invoke-direct {p1, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-static {p1}, Lm30;->c(Ljava/io/File;)V

    .line 125
    .line 126
    .line 127
    iput-object p1, p0, Lm30;->p:Ljava/lang/Object;

    .line 128
    .line 129
    return-void
.end method

.method public constructor <init>(Ljw0;Ljw0;Ljw0;Ljw0;Ljw0;Ljw0;Ljw0;)V
    .locals 0

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    iput-object p1, p0, Lm30;->j:Ljava/lang/Object;

    .line 132
    iput-object p2, p0, Lm30;->k:Ljava/lang/Object;

    .line 133
    iput-object p3, p0, Lm30;->l:Ljava/lang/Object;

    .line 134
    iput-object p4, p0, Lm30;->m:Ljava/lang/Object;

    .line 135
    iput-object p5, p0, Lm30;->n:Ljava/lang/Object;

    .line 136
    iput-object p6, p0, Lm30;->o:Ljava/lang/Object;

    .line 137
    iput-object p7, p0, Lm30;->p:Ljava/lang/Object;

    return-void
.end method

.method public static declared-synchronized c(Ljava/io/File;)V
    .locals 2

    .line 1
    const-class v0, Lm30;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    .line 11
    .line 12
    .line 13
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    .line 36
    :cond_2
    monitor-exit v0

    .line 37
    return-void

    .line 38
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 39
    throw p0
.end method

.method public static d(Ljava/io/File;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    array-length v1, v0

    .line 8
    const/4 v2, 0x0

    .line 9
    :goto_0
    if-ge v2, v1, :cond_0

    .line 10
    .line 11
    aget-object v3, v0, v2

    .line 12
    .line 13
    invoke-static {v3}, Lm30;->d(Ljava/io/File;)Z

    .line 14
    .line 15
    .line 16
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public static e([Ljava/lang/Object;)Ljava/util/List;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object p0, p0, Lm30;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Ljava/io/File;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-static {v0}, Lm30;->d(Ljava/io/File;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    new-instance v1, Ljava/io/File;

    .line 4
    .line 5
    iget-object p0, p0, Lm30;->m:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ljava/io/File;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 13
    .line 14
    .line 15
    invoke-direct {v0, v1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public get()Ljava/lang/Object;
    .locals 9

    .line 1
    iget-object v0, p0, Lm30;->j:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljw0;

    .line 4
    .line 5
    invoke-interface {v0}, Lkw0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    move-object v2, v0

    .line 10
    check-cast v2, Ll51;

    .line 11
    .line 12
    iget-object v0, p0, Lm30;->k:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ljw0;

    .line 15
    .line 16
    invoke-interface {v0}, Lkw0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    move-object v3, v0

    .line 21
    check-cast v3, Le51;

    .line 22
    .line 23
    iget-object v0, p0, Lm30;->l:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, Ljw0;

    .line 26
    .line 27
    invoke-interface {v0}, Lkw0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    move-object v4, v0

    .line 32
    check-cast v4, Ld51;

    .line 33
    .line 34
    iget-object v0, p0, Lm30;->m:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v0, Ljw0;

    .line 37
    .line 38
    invoke-interface {v0}, Lkw0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    move-object v5, v0

    .line 43
    check-cast v5, Lkc1;

    .line 44
    .line 45
    iget-object v0, p0, Lm30;->n:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v0, Ljw0;

    .line 48
    .line 49
    invoke-interface {v0}, Lkw0;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    move-object v6, v0

    .line 54
    check-cast v6, Lyt;

    .line 55
    .line 56
    iget-object v0, p0, Lm30;->o:Ljava/lang/Object;

    .line 57
    .line 58
    check-cast v0, Ljw0;

    .line 59
    .line 60
    invoke-interface {v0}, Lkw0;->get()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    move-object v7, v0

    .line 65
    check-cast v7, Liv0;

    .line 66
    .line 67
    iget-object p0, p0, Lm30;->p:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast p0, Ljw0;

    .line 70
    .line 71
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    move-object v8, p0

    .line 76
    check-cast v8, Lsq;

    .line 77
    .line 78
    new-instance v1, Lq71;

    .line 79
    .line 80
    invoke-direct/range {v1 .. v8}, Lq71;-><init>(Ll51;Le51;Ld51;Lkc1;Lyt;Liv0;Lsq;)V

    .line 81
    .line 82
    .line 83
    return-object v1
.end method
