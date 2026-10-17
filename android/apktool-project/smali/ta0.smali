.class public final Lta0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final c:Lta0;


# instance fields
.field public final a:Lok0;

.field public final b:Landroid/os/Looper;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lok0;

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lok0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v2, Lta0;

    .line 13
    .line 14
    invoke-direct {v2, v0, v1}, Lta0;-><init>(Lok0;Landroid/os/Looper;)V

    .line 15
    .line 16
    .line 17
    sput-object v2, Lta0;->c:Lta0;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Lok0;Landroid/os/Looper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lta0;->a:Lok0;

    .line 5
    .line 6
    iput-object p2, p0, Lta0;->b:Landroid/os/Looper;

    .line 7
    .line 8
    return-void
.end method
