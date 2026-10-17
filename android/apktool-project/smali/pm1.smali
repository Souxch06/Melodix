.class public final Lpm1;
.super Lua0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final j:Ls7;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ltb0;

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ltb0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ldl1;

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    invoke-direct {v1, v2}, Ldl1;-><init>(I)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ls7;

    .line 15
    .line 16
    const-string v3, "ClientTelemetry.API"

    .line 17
    .line 18
    const/4 v4, 0x3

    .line 19
    invoke-direct {v2, v3, v1, v0, v4}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 20
    .line 21
    .line 22
    sput-object v2, Lpm1;->j:Ls7;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final c(Lsb1;)Ljd2;
    .locals 3

    .line 1
    invoke-static {}, Lo80;->b()Lo80;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Las;->h:Lu20;

    .line 6
    .line 7
    filled-new-array {v1}, [Lu20;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lo80;->c:Ljava/lang/Object;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput-boolean v1, v0, Lo80;->a:Z

    .line 15
    .line 16
    new-instance v1, Lny0;

    .line 17
    .line 18
    const/16 v2, 0xf

    .line 19
    .line 20
    invoke-direct {v1, v2, p1}, Lny0;-><init>(ILjava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, v0, Lo80;->b:Ljava/lang/Object;

    .line 24
    .line 25
    invoke-virtual {v0}, Lo80;->a()Lo80;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v0, 0x2

    .line 30
    invoke-virtual {p0, v0, p1}, Lua0;->b(ILo80;)Ljd2;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method
