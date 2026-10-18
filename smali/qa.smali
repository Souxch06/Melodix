.class public final Lqa;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lir0;


# static fields
.field public static final a:Lqa;

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
    new-instance v0, Lqa;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lqa;->a:Lqa;

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
    sput-object v0, Lqa;->b:Lv20;

    .line 15
    .line 16
    const-string v0, "model"

    .line 17
    .line 18
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lqa;->c:Lv20;

    .line 23
    .line 24
    const-string v0, "hardware"

    .line 25
    .line 26
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lqa;->d:Lv20;

    .line 31
    .line 32
    const-string v0, "device"

    .line 33
    .line 34
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Lqa;->e:Lv20;

    .line 39
    .line 40
    const-string v0, "product"

    .line 41
    .line 42
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lqa;->f:Lv20;

    .line 47
    .line 48
    const-string v0, "osBuild"

    .line 49
    .line 50
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Lqa;->g:Lv20;

    .line 55
    .line 56
    const-string v0, "manufacturer"

    .line 57
    .line 58
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sput-object v0, Lqa;->h:Lv20;

    .line 63
    .line 64
    const-string v0, "fingerprint"

    .line 65
    .line 66
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    sput-object v0, Lqa;->i:Lv20;

    .line 71
    .line 72
    const-string v0, "locale"

    .line 73
    .line 74
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    sput-object v0, Lqa;->j:Lv20;

    .line 79
    .line 80
    const-string v0, "country"

    .line 81
    .line 82
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sput-object v0, Lqa;->k:Lv20;

    .line 87
    .line 88
    const-string v0, "mccMnc"

    .line 89
    .line 90
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    sput-object v0, Lqa;->l:Lv20;

    .line 95
    .line 96
    const-string v0, "applicationBuild"

    .line 97
    .line 98
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    sput-object v0, Lqa;->m:Lv20;

    .line 103
    .line 104
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Lb5;

    .line 2
    .line 3
    check-cast p2, Ljr0;

    .line 4
    .line 5
    move-object p0, p1

    .line 6
    check-cast p0, Lrc;

    .line 7
    .line 8
    iget-object p0, p0, Lrc;->a:Ljava/lang/Integer;

    .line 9
    .line 10
    sget-object v0, Lqa;->b:Lv20;

    .line 11
    .line 12
    invoke-interface {p2, v0, p0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 13
    .line 14
    .line 15
    check-cast p1, Lrc;

    .line 16
    .line 17
    iget-object p0, p1, Lrc;->b:Ljava/lang/String;

    .line 18
    .line 19
    sget-object v0, Lqa;->c:Lv20;

    .line 20
    .line 21
    invoke-interface {p2, v0, p0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 22
    .line 23
    .line 24
    sget-object p0, Lqa;->d:Lv20;

    .line 25
    .line 26
    iget-object v0, p1, Lrc;->c:Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 29
    .line 30
    .line 31
    sget-object p0, Lqa;->e:Lv20;

    .line 32
    .line 33
    iget-object v0, p1, Lrc;->d:Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 36
    .line 37
    .line 38
    sget-object p0, Lqa;->f:Lv20;

    .line 39
    .line 40
    iget-object v0, p1, Lrc;->e:Ljava/lang/String;

    .line 41
    .line 42
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 43
    .line 44
    .line 45
    sget-object p0, Lqa;->g:Lv20;

    .line 46
    .line 47
    iget-object v0, p1, Lrc;->f:Ljava/lang/String;

    .line 48
    .line 49
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 50
    .line 51
    .line 52
    sget-object p0, Lqa;->h:Lv20;

    .line 53
    .line 54
    iget-object v0, p1, Lrc;->g:Ljava/lang/String;

    .line 55
    .line 56
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 57
    .line 58
    .line 59
    sget-object p0, Lqa;->i:Lv20;

    .line 60
    .line 61
    iget-object v0, p1, Lrc;->h:Ljava/lang/String;

    .line 62
    .line 63
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 64
    .line 65
    .line 66
    sget-object p0, Lqa;->j:Lv20;

    .line 67
    .line 68
    iget-object v0, p1, Lrc;->i:Ljava/lang/String;

    .line 69
    .line 70
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 71
    .line 72
    .line 73
    sget-object p0, Lqa;->k:Lv20;

    .line 74
    .line 75
    iget-object v0, p1, Lrc;->j:Ljava/lang/String;

    .line 76
    .line 77
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 78
    .line 79
    .line 80
    sget-object p0, Lqa;->l:Lv20;

    .line 81
    .line 82
    iget-object v0, p1, Lrc;->k:Ljava/lang/String;

    .line 83
    .line 84
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 85
    .line 86
    .line 87
    sget-object p0, Lqa;->m:Lv20;

    .line 88
    .line 89
    iget-object p1, p1, Lrc;->l:Ljava/lang/String;

    .line 90
    .line 91
    invoke-interface {p2, p0, p1}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 92
    .line 93
    .line 94
    return-void
.end method
