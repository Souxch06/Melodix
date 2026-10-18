.class public final Loc;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lir0;


# static fields
.field public static final a:Loc;

.field public static final b:Lv20;

.field public static final c:Lv20;

.field public static final d:Lv20;

.field public static final e:Lv20;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Loc;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Loc;->a:Loc;

    .line 7
    .line 8
    const-string v0, "processName"

    .line 9
    .line 10
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Loc;->b:Lv20;

    .line 15
    .line 16
    const-string v0, "pid"

    .line 17
    .line 18
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Loc;->c:Lv20;

    .line 23
    .line 24
    const-string v0, "importance"

    .line 25
    .line 26
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Loc;->d:Lv20;

    .line 31
    .line 32
    const-string v0, "defaultProcess"

    .line 33
    .line 34
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Loc;->e:Lv20;

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Ljv0;

    .line 2
    .line 3
    check-cast p2, Ljr0;

    .line 4
    .line 5
    sget-object p0, Loc;->b:Lv20;

    .line 6
    .line 7
    iget-object v0, p1, Ljv0;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 10
    .line 11
    .line 12
    sget-object p0, Loc;->c:Lv20;

    .line 13
    .line 14
    iget v0, p1, Ljv0;->b:I

    .line 15
    .line 16
    invoke-interface {p2, p0, v0}, Ljr0;->e(Lv20;I)Ljr0;

    .line 17
    .line 18
    .line 19
    sget-object p0, Loc;->d:Lv20;

    .line 20
    .line 21
    iget v0, p1, Ljv0;->c:I

    .line 22
    .line 23
    invoke-interface {p2, p0, v0}, Ljr0;->e(Lv20;I)Ljr0;

    .line 24
    .line 25
    .line 26
    sget-object p0, Loc;->e:Lv20;

    .line 27
    .line 28
    iget-boolean p1, p1, Ljv0;->d:Z

    .line 29
    .line 30
    invoke-interface {p2, p0, p1}, Ljr0;->d(Lv20;Z)Ljr0;

    .line 31
    .line 32
    .line 33
    return-void
.end method
