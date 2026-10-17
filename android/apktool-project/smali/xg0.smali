.class public Lxg0;
.super Ll41;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    const-string v0, "An unknown field for index "

    .line 2
    .line 3
    invoke-static {p1, v0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
