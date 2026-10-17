.class public final Lbb;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lir0;


# static fields
.field public static final a:Lbb;

.field public static final b:Lv20;

.field public static final c:Lv20;

.field public static final d:Lv20;

.field public static final e:Lv20;

.field public static final f:Lv20;

.field public static final g:Lv20;

.field public static final h:Lv20;

.field public static final i:Lv20;

.field public static final j:Lv20;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lbb;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lbb;->a:Lbb;

    .line 7
    .line 8
    const-string v0, "pid"

    .line 9
    .line 10
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lbb;->b:Lv20;

    .line 15
    .line 16
    const-string v0, "processName"

    .line 17
    .line 18
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lbb;->c:Lv20;

    .line 23
    .line 24
    const-string v0, "reasonCode"

    .line 25
    .line 26
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lbb;->d:Lv20;

    .line 31
    .line 32
    const-string v0, "importance"

    .line 33
    .line 34
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Lbb;->e:Lv20;

    .line 39
    .line 40
    const-string v0, "pss"

    .line 41
    .line 42
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lbb;->f:Lv20;

    .line 47
    .line 48
    const-string v0, "rss"

    .line 49
    .line 50
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Lbb;->g:Lv20;

    .line 55
    .line 56
    const-string v0, "timestamp"

    .line 57
    .line 58
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sput-object v0, Lbb;->h:Lv20;

    .line 63
    .line 64
    const-string v0, "traceFile"

    .line 65
    .line 66
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    sput-object v0, Lbb;->i:Lv20;

    .line 71
    .line 72
    const-string v0, "buildIdMappingForArch"

    .line 73
    .line 74
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    sput-object v0, Lbb;->j:Lv20;

    .line 79
    .line 80
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Lwr;

    .line 2
    .line 3
    check-cast p2, Ljr0;

    .line 4
    .line 5
    move-object p0, p1

    .line 6
    check-cast p0, Lbd;

    .line 7
    .line 8
    iget p0, p0, Lbd;->a:I

    .line 9
    .line 10
    sget-object v0, Lbb;->b:Lv20;

    .line 11
    .line 12
    invoke-interface {p2, v0, p0}, Ljr0;->e(Lv20;I)Ljr0;

    .line 13
    .line 14
    .line 15
    check-cast p1, Lbd;

    .line 16
    .line 17
    iget-object p0, p1, Lbd;->b:Ljava/lang/String;

    .line 18
    .line 19
    sget-object v0, Lbb;->c:Lv20;

    .line 20
    .line 21
    invoke-interface {p2, v0, p0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 22
    .line 23
    .line 24
    sget-object p0, Lbb;->d:Lv20;

    .line 25
    .line 26
    iget v0, p1, Lbd;->c:I

    .line 27
    .line 28
    invoke-interface {p2, p0, v0}, Ljr0;->e(Lv20;I)Ljr0;

    .line 29
    .line 30
    .line 31
    sget-object p0, Lbb;->e:Lv20;

    .line 32
    .line 33
    iget v0, p1, Lbd;->d:I

    .line 34
    .line 35
    invoke-interface {p2, p0, v0}, Ljr0;->e(Lv20;I)Ljr0;

    .line 36
    .line 37
    .line 38
    sget-object p0, Lbb;->f:Lv20;

    .line 39
    .line 40
    iget-wide v0, p1, Lbd;->e:J

    .line 41
    .line 42
    invoke-interface {p2, p0, v0, v1}, Ljr0;->g(Lv20;J)Ljr0;

    .line 43
    .line 44
    .line 45
    sget-object p0, Lbb;->g:Lv20;

    .line 46
    .line 47
    iget-wide v0, p1, Lbd;->f:J

    .line 48
    .line 49
    invoke-interface {p2, p0, v0, v1}, Ljr0;->g(Lv20;J)Ljr0;

    .line 50
    .line 51
    .line 52
    sget-object p0, Lbb;->h:Lv20;

    .line 53
    .line 54
    iget-wide v0, p1, Lbd;->g:J

    .line 55
    .line 56
    invoke-interface {p2, p0, v0, v1}, Ljr0;->g(Lv20;J)Ljr0;

    .line 57
    .line 58
    .line 59
    sget-object p0, Lbb;->i:Lv20;

    .line 60
    .line 61
    iget-object v0, p1, Lbd;->h:Ljava/lang/String;

    .line 62
    .line 63
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 64
    .line 65
    .line 66
    sget-object p0, Lbb;->j:Lv20;

    .line 67
    .line 68
    iget-object p1, p1, Lbd;->i:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {p2, p0, p1}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 71
    .line 72
    .line 73
    return-void
.end method
