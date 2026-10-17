.class public final Lf80;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final f:Lg5;


# instance fields
.field public final a:Ljava/util/WeakHashMap;

.field public final b:Lmz;

.field public final c:Lvd1;

.field public final d:Lr9;

.field public final e:Ln80;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lg5;->c()Lg5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lf80;->f:Lg5;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Lmz;Lvd1;Lr9;Ln80;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/WeakHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lf80;->a:Ljava/util/WeakHashMap;

    .line 10
    .line 11
    iput-object p1, p0, Lf80;->b:Lmz;

    .line 12
    .line 13
    iput-object p2, p0, Lf80;->c:Lvd1;

    .line 14
    .line 15
    iput-object p3, p0, Lf80;->d:Lr9;

    .line 16
    .line 17
    iput-object p4, p0, Lf80;->e:Ln80;

    .line 18
    .line 19
    return-void
.end method
