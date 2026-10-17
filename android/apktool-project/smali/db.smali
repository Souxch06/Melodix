.class public final Ldb;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lir0;


# static fields
.field public static final a:Ldb;

.field public static final b:Lv20;

.field public static final c:Lv20;

.field public static final d:Lv20;

.field public static final e:Lv20;

.field public static final f:Lv20;

.field public static final g:Lv20;

.field public static final h:Lv20;

.field public static final i:Lv20;

.field public static final j:Lv20;

.field public static final k:Lv20;

.field public static final l:Lv20;

.field public static final m:Lv20;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ldb;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ldb;->a:Ldb;

    .line 7
    .line 8
    const-string v0, "sdkVersion"

    .line 9
    .line 10
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Ldb;->b:Lv20;

    .line 15
    .line 16
    const-string v0, "gmpAppId"

    .line 17
    .line 18
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Ldb;->c:Lv20;

    .line 23
    .line 24
    const-string v0, "platform"

    .line 25
    .line 26
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Ldb;->d:Lv20;

    .line 31
    .line 32
    const-string v0, "installationUuid"

    .line 33
    .line 34
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Ldb;->e:Lv20;

    .line 39
    .line 40
    const-string v0, "firebaseInstallationId"

    .line 41
    .line 42
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Ldb;->f:Lv20;

    .line 47
    .line 48
    const-string v0, "firebaseAuthenticationToken"

    .line 49
    .line 50
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Ldb;->g:Lv20;

    .line 55
    .line 56
    const-string v0, "appQualitySessionId"

    .line 57
    .line 58
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sput-object v0, Ldb;->h:Lv20;

    .line 63
    .line 64
    const-string v0, "buildVersion"

    .line 65
    .line 66
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    sput-object v0, Ldb;->i:Lv20;

    .line 71
    .line 72
    const-string v0, "displayVersion"

    .line 73
    .line 74
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    sput-object v0, Ldb;->j:Lv20;

    .line 79
    .line 80
    const-string v0, "session"

    .line 81
    .line 82
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sput-object v0, Ldb;->k:Lv20;

    .line 87
    .line 88
    const-string v0, "ndkPayload"

    .line 89
    .line 90
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    sput-object v0, Ldb;->l:Lv20;

    .line 95
    .line 96
    const-string v0, "appExitInfo"

    .line 97
    .line 98
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    sput-object v0, Ldb;->m:Lv20;

    .line 103
    .line 104
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Lus;

    .line 2
    .line 3
    check-cast p2, Ljr0;

    .line 4
    .line 5
    move-object p0, p1

    .line 6
    check-cast p0, Lyc;

    .line 7
    .line 8
    iget-object p0, p0, Lyc;->b:Ljava/lang/String;

    .line 9
    .line 10
    sget-object v0, Ldb;->b:Lv20;

    .line 11
    .line 12
    invoke-interface {p2, v0, p0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 13
    .line 14
    .line 15
    check-cast p1, Lyc;

    .line 16
    .line 17
    iget-object p0, p1, Lyc;->c:Ljava/lang/String;

    .line 18
    .line 19
    sget-object v0, Ldb;->c:Lv20;

    .line 20
    .line 21
    invoke-interface {p2, v0, p0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 22
    .line 23
    .line 24
    sget-object p0, Ldb;->d:Lv20;

    .line 25
    .line 26
    iget v0, p1, Lyc;->d:I

    .line 27
    .line 28
    invoke-interface {p2, p0, v0}, Ljr0;->e(Lv20;I)Ljr0;

    .line 29
    .line 30
    .line 31
    sget-object p0, Ldb;->e:Lv20;

    .line 32
    .line 33
    iget-object v0, p1, Lyc;->e:Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 36
    .line 37
    .line 38
    sget-object p0, Ldb;->f:Lv20;

    .line 39
    .line 40
    iget-object v0, p1, Lyc;->f:Ljava/lang/String;

    .line 41
    .line 42
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 43
    .line 44
    .line 45
    sget-object p0, Ldb;->g:Lv20;

    .line 46
    .line 47
    iget-object v0, p1, Lyc;->g:Ljava/lang/String;

    .line 48
    .line 49
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 50
    .line 51
    .line 52
    sget-object p0, Ldb;->h:Lv20;

    .line 53
    .line 54
    iget-object v0, p1, Lyc;->h:Ljava/lang/String;

    .line 55
    .line 56
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 57
    .line 58
    .line 59
    sget-object p0, Ldb;->i:Lv20;

    .line 60
    .line 61
    iget-object v0, p1, Lyc;->i:Ljava/lang/String;

    .line 62
    .line 63
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 64
    .line 65
    .line 66
    sget-object p0, Ldb;->j:Lv20;

    .line 67
    .line 68
    iget-object v0, p1, Lyc;->j:Ljava/lang/String;

    .line 69
    .line 70
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 71
    .line 72
    .line 73
    sget-object p0, Ldb;->k:Lv20;

    .line 74
    .line 75
    iget-object v0, p1, Lyc;->k:Lts;

    .line 76
    .line 77
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 78
    .line 79
    .line 80
    sget-object p0, Ldb;->l:Lv20;

    .line 81
    .line 82
    iget-object v0, p1, Lyc;->l:Lzr;

    .line 83
    .line 84
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 85
    .line 86
    .line 87
    sget-object p0, Ldb;->m:Lv20;

    .line 88
    .line 89
    iget-object p1, p1, Lyc;->m:Lwr;

    .line 90
    .line 91
    invoke-interface {p2, p0, p1}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 92
    .line 93
    .line 94
    return-void
.end method
