.class public final Lf10;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Llw0;


# direct methods
.method public constructor <init>(Llw0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lf10;->a:Llw0;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a(Lz41;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lf10;->a:Llw0;

    .line 2
    .line 3
    invoke-interface {v0}, Llw0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lqd1;

    .line 8
    .line 9
    new-instance v1, La10;

    .line 10
    .line 11
    const-string v2, "json"

    .line 12
    .line 13
    invoke-direct {v1, v2}, La10;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Lz0;

    .line 17
    .line 18
    invoke-direct {v2, p0}, Lz0;-><init>(Lf10;)V

    .line 19
    .line 20
    .line 21
    check-cast v0, Lrd1;

    .line 22
    .line 23
    const-string p0, "FIREBASE_APPQUALITY_SESSION"

    .line 24
    .line 25
    invoke-virtual {v0, p0, v1, v2}, Lrd1;->a(Ljava/lang/String;La10;Lnd1;)Law;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v0, Lje;

    .line 30
    .line 31
    sget-object v1, Lav0;->j:Lav0;

    .line 32
    .line 33
    invoke-direct {v0, p1, v1}, Lje;-><init>(Ljava/lang/Object;Lav0;)V

    .line 34
    .line 35
    .line 36
    new-instance p1, Lo40;

    .line 37
    .line 38
    const/16 v1, 0x1b

    .line 39
    .line 40
    invoke-direct {p1, v1}, Lo40;-><init>(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0, p1}, Law;->a(Lje;Lyd1;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
