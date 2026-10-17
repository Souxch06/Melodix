.class public final Lqb;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lir0;


# static fields
.field public static final a:Lqb;

.field public static final b:Lv20;

.field public static final c:Lv20;

.field public static final d:Lv20;

.field public static final e:Lv20;

.field public static final f:Lv20;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lqb;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lqb;->a:Lqb;

    .line 7
    .line 8
    const-string v0, "pc"

    .line 9
    .line 10
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lqb;->b:Lv20;

    .line 15
    .line 16
    const-string v0, "symbol"

    .line 17
    .line 18
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lqb;->c:Lv20;

    .line 23
    .line 24
    const-string v0, "file"

    .line 25
    .line 26
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lqb;->d:Lv20;

    .line 31
    .line 32
    const-string v0, "offset"

    .line 33
    .line 34
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Lqb;->e:Lv20;

    .line 39
    .line 40
    const-string v0, "importance"

    .line 41
    .line 42
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lqb;->f:Lv20;

    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Lgs;

    .line 2
    .line 3
    check-cast p2, Ljr0;

    .line 4
    .line 5
    move-object p0, p1

    .line 6
    check-cast p0, Lvd;

    .line 7
    .line 8
    iget-wide v0, p0, Lvd;->a:J

    .line 9
    .line 10
    sget-object p0, Lqb;->b:Lv20;

    .line 11
    .line 12
    invoke-interface {p2, p0, v0, v1}, Ljr0;->g(Lv20;J)Ljr0;

    .line 13
    .line 14
    .line 15
    check-cast p1, Lvd;

    .line 16
    .line 17
    iget-object p0, p1, Lvd;->b:Ljava/lang/String;

    .line 18
    .line 19
    sget-object v0, Lqb;->c:Lv20;

    .line 20
    .line 21
    invoke-interface {p2, v0, p0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 22
    .line 23
    .line 24
    sget-object p0, Lqb;->d:Lv20;

    .line 25
    .line 26
    iget-object v0, p1, Lvd;->c:Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 29
    .line 30
    .line 31
    sget-object p0, Lqb;->e:Lv20;

    .line 32
    .line 33
    iget-wide v0, p1, Lvd;->d:J

    .line 34
    .line 35
    invoke-interface {p2, p0, v0, v1}, Ljr0;->g(Lv20;J)Ljr0;

    .line 36
    .line 37
    .line 38
    sget-object p0, Lqb;->f:Lv20;

    .line 39
    .line 40
    iget p1, p1, Lvd;->e:I

    .line 41
    .line 42
    invoke-interface {p2, p0, p1}, Ljr0;->e(Lv20;I)Ljr0;

    .line 43
    .line 44
    .line 45
    return-void
.end method
