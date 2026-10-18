.class public final Ls;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final b:Ls;


# instance fields
.field public final a:Ljava/lang/Throwable;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ls;

    .line 2
    .line 3
    new-instance v1, Lr;

    .line 4
    .line 5
    const-string v2, "Failure occurred while trying to finish a future."

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-direct {v1, v2, v3}, Lr;-><init>(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Ls;-><init>(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ls;->b:Ls;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ls;->a:Ljava/lang/Throwable;

    .line 8
    .line 9
    return-void
.end method
